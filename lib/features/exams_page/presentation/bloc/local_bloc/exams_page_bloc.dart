import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timetable_app/core/di/get_it.dart';
import 'package:timetable_app/features/exams_page/domain/entities/exam.dart';
import 'package:timetable_app/features/exams_page/domain/usecases/get_all_exams_for_user_usecase.dart';

part 'exams_page_bloc_state.dart';
part 'exams_page_bloc_event.dart';

class ExamsPageBloc extends Bloc<ExamsPageBlocEvent, ExamsPageBlocState> {
  ExamsPageBloc() : super(ExamsPageInitialState()) {
		on<ExamsPageLessonsRequested>(_onLessonsRequested);
	}
  
	Future<void> _onLessonsRequested(ExamsPageLessonsRequested event, Emitter<ExamsPageBlocState> emit) async {
		try {
			Stream<List<Exam>> examsStream = getIt.get<GetAllExamsForUserUsecase>().execute();
			emit(ExamsPageLoadedState(examsStrean: examsStream));
		} catch (e) {
			emit(ExamsPageErrorState(error: e.toString()));
		}
	}
}
