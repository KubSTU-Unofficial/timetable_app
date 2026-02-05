abstract class InitPageBlockEvent {}

class InstituteSelectedEvent implements InitPageBlockEvent {
	final String? institute;

	InstituteSelectedEvent(this.institute);
}

class GroupSelectedEvent implements InitPageBlockEvent {
	final String? group;

	GroupSelectedEvent(this.group);
}
