import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/core/di/get_it.dart';
import 'package:timetable_app/features/exams_page/domain/usecases/ensure_exams_up_to_date_for_user_usecase.dart';
import 'package:timetable_app/features/exams_page/domain/usecases/update_exams_for_user_usecase.dart';
import 'package:timetable_app/shared/data/shared_prefs_keys.dart';

part 'exams_loading_bloc_state.dart';
part 'exams_loading_bloc_event.dart';

class ExamsLoadingBloc extends Bloc<ExamsLoadingBlocEvent, ExamsLoadingBlocState> {
  ExamsLoadingBloc() : super(ExamsInitialState()) {
		on<ExamsLoadingEnsureDataLoadedEvent>(_onEnsureDataLoaded);
		on<ExamsLoadingUpdateEvent>(_onUpdate);
	}
  
	Future<void> _onUpdate(ExamsLoadingUpdateEvent event, Emitter<ExamsLoadingBlocState> emit) async {
		try {
			emit(ExamsLoadingInProcessState());
			DateTime updatedAt = await getIt.get<UpdateExamsForUserUsecase>().execute();
			emit(ExamsLoadingReadyState(updatedAt: updatedAt));
		} catch (e) {
			emit(ExamsLoadingErrorState(error: e.toString()));
		}
	}

	Future<void> _onEnsureDataLoaded(ExamsLoadingEnsureDataLoadedEvent event, Emitter<ExamsLoadingBlocState> emit) async {
		SharedPreferences prefs = getIt.get<SharedPreferences>();
		String? lastUpdateTime = prefs.getString(userExamsUpdatedAt);
		if (lastUpdateTime != null) {
			emit(ExamsLoadingInProcessState());
		} else {
			emit(ExamsInitialLoadingInProcessState());
		}
		try {
			DateTime updatedAt = await getIt.get<EnsureExamsUpToDateForUserUsecase>().execute();
			emit(ExamsLoadingReadyState(updatedAt: updatedAt));
		} catch (e) {
			emit(ExamsLoadingErrorState(error: e.toString()));
		}
	}
}
