part of "init_page_bloc.dart";

abstract class InitPageBlockEvent {}

class InitEvent extends InitPageBlockEvent {}

class SetupFinishedEvent extends InitPageBlockEvent {
	final String group;

  SetupFinishedEvent({required this.group});
}
