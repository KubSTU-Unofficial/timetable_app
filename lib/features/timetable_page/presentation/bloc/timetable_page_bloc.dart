import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timetable_app/core/di/get_it.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';
import 'package:timetable_app/shared/domain/usecases/get_all_classes_for_group_usecase.dart';

part 'timetable_page_bloc_state.dart';
part 'timetable_page_bloc_event.dart';

class TimetablePageBloc extends Bloc<TimetablePageBlocEvent, TimetablePageBlocState> {
  TimetablePageBloc() : super(TimetablePageInitialState()) {
		on<TimetablePageLessonsRequested>(_onLessonsRequested);
	}
  
	Future<void> _onLessonsRequested(TimetablePageLessonsRequested event, Emitter<TimetablePageBlocState> emit) async {
		try {
			Stream<List<Lesson>> lessons = getIt.get<GetAllLessonsForUserGroupUsecase>().execute();
			emit(TimetablePageLoadedState(lessons: lessons));
		} catch (e) {
			emit(TimetablePageErrorState(error: e.toString()));
		}
	}
}
