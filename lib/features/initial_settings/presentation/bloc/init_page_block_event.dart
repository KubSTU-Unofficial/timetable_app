part of "init_page_bloc.dart";

abstract class InitPageBlockEvent {}

class loudGroupsEvent extends InitPageBlockEvent {
  final String groupName;

  loudGroupsEvent(this.groupName);
}
