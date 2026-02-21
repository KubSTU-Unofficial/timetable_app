import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_app/core/di/get_it.dart';
import 'package:timetable_app/shared/data/shared_prefs_keys.dart';
import 'package:timetable_app/shared/domain/usecases/ensure_user_group_classes_up_to_data_usecase.dart';
import 'package:timetable_app/shared/domain/usecases/update_lessons_for_user_usecase.dart';

part 'timetable_loading_bloc_event.dart';
part 'timetable_loading_bloc_state.dart';

class TimetableLoadingBloc extends Bloc<TimetableLoadingBlocEvent, TimetableLoadingBlocState> {
  TimetableLoadingBloc() : super(TimetableInitialLoadingInProcessState()) {
		on<TimetableLoadingEnsureDataLoadedEvent>(_onEnsureDataLoaded);
		on<TimetableLoadingUpdateEvent>(_onUpdate);
	}
  
	Future<void> _onUpdate(TimetableLoadingUpdateEvent event, Emitter<TimetableLoadingBlocState> emit) async {
		try {
			emit(TimetableLoadingInProcessState());
			DateTime updatedAt = await getIt.get<UpdateLessonsForUserUsecase>().execute();
			emit(TimetableLoadingReadyState(updatedAt: updatedAt));
		} catch (e) {
			emit(TimetableLoadingErrorState(error: e.toString()));
		}
	}

	Future<void> _onEnsureDataLoaded(TimetableLoadingEnsureDataLoadedEvent event, Emitter<TimetableLoadingBlocState> emit) async {
		SharedPreferences prefs = getIt.get<SharedPreferences>();
		String? lastUpdateTime = prefs.getString(userLessonsUpdatedAt);
		if (lastUpdateTime != null) {
			emit(TimetableLoadingInProcessState());
		}
		try {
			DateTime updatedAt = await getIt.get<EnsureUserGroupClassesUpToDataUsecase>().execute();
			emit(TimetableLoadingReadyState(updatedAt: updatedAt));
		} catch (e) {
			emit(TimetableLoadingErrorState(error: e.toString()));
		}
	}
}
