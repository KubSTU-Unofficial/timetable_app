import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timetable_app/core/di/get_it.dart';
import 'package:timetable_app/features/teachers_page/domain/usecases/get_all_teachers_usecase.dart';
import 'package:timetable_app/features/teachers_page/domain/usecases/get_lessons_for_teacher_usecase.dart';
import 'package:timetable_app/shared/domain/entities/lesson.dart';

part 'teachers_page_bloc_event.dart';
part 'teachers_page_bloc_state.dart';

class TeachersPageBloc extends Bloc<TeachersPageBlocEvent, TeachersPageBlocState>  {
  TeachersPageBloc() : super(TeachersPageInitialState()) {
		on<TeachersPageInitEvent>((TeachersPageInitEvent event, Emitter<TeachersPageBlocState> emit) async {
			emit(TeachersPageLoadedState(
				teachers: await getIt.get<GetAllTeachersUsecase>().execute()
			));
		});

		on<TeacherRequestedEvent>((TeacherRequestedEvent event, Emitter<TeachersPageBlocState> emit) async {
			if (state is! TeachersPageLoadedState) return;
			emit(TeachersPageLoadedState(
				teachers: (state as TeachersPageLoadedState).teachers,
				lessons: getIt.get<GetLessonsForTeacherUsecase>().execute(event.name)
			));
		});
	}
}
