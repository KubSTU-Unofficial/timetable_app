import 'package:timetable_app/common/domain/entities/group/group.dart';

class InitPageBlocState {
  final List<Group> groups;
	final String? selectedInstitute;
  final String? selectedGroup;
  final String? errorMessage;

  const InitPageBlocState({
    this.groups = const [],
    this.selectedInstitute,
    this.selectedGroup,
    this.errorMessage,
  });
}

