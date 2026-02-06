import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/core/di/get_it.dart';
import 'package:timetable_app/features/initial_settings/domain/entities/group/group.dart';
import 'package:timetable_app/features/initial_settings/domain/usecases/get_all_groups_usecase.dart';
import 'package:timetable_app/shared/data/shared_prefs_keys.dart';
import 'dart:async';

part 'init_page_block_event.dart';
part 'init_page_bloc_state.dart';

class InitPageBloc extends Bloc<InitPageBlockEvent, InitPageBlocState> {
	InitPageBloc() : super(InitPageInitial()) {
		on<InitEvent>(_init);
		on<SetupFinishedEvent>(_onSetupFinished);
	}

	Future<void> _init(InitEvent event, Emitter<InitPageBlocState> emit) async {
		Timer? timer;
		try {
			timer = Timer(const Duration(seconds: 1), () {
				emit(InitPageLoading());
			});
			emit(InitPageLoaded(
				groups: await getIt.get<GetAllGroupsUsecase>().execute()
			));
		} catch (e) {
			emit(InitPageError(errorMessage: e.toString()));
		} finally { timer?.cancel(); }
	}

	Future<void> _onSetupFinished(SetupFinishedEvent event, Emitter<InitPageBlocState> emit) async {
		if (state is! InitPageLoaded) { return; }
		await getIt.get<SharedPreferences>().setBool(isInitializedKey, true);
		await getIt.get<SharedPreferences>().setString(defaultGroupKey, event.group);
		emit(InitPageSetupFinished());
	}
}
