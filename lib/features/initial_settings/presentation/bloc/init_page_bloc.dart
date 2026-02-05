import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timetable_app/core/di/get_it.dart';
import 'package:timetable_app/features/initial_settings/domain/entities/group/group.dart';
import 'package:timetable_app/features/initial_settings/domain/usecases/get_groups_by_institute_usecase.dart';
import 'package:timetable_app/features/initial_settings/presentation/bloc/init_page_bloc_state.dart';
import 'package:timetable_app/features/initial_settings/presentation/bloc/init_page_block_event.dart';

class InitPageBloc extends Bloc<InitPageBlockEvent, InitPageBlocState> {
  InitPageBloc() : super(InitPageBlocState()) {

		on<InstituteSelectedEvent>((event, emit) async {
			List<Group> groups = [];
			String? error;
			if (event.institute != null) {
				try {
					groups = await getIt.get<GetGroupsByInstituteUsecase>().execute(event.institute!);
				} catch (e) {
					error = e.toString();
				}
			}
			emit(InitPageBlocState(
				groups: groups,
				selectedInstitute: event.institute,
				selectedGroup: null,
				errorMessage: error,
			));
		});

		on<GroupSelectedEvent>((event, emit) {
			emit(InitPageBlocState(
				groups: state.groups,
				selectedInstitute: state.selectedInstitute,
				selectedGroup: event.group,
				errorMessage: null
			));
		});
	}
}
