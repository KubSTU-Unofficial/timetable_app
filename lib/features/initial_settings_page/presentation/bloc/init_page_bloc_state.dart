part of "init_page_bloc.dart";

sealed class InitPageBlocState {}

class InitPageInitial extends InitPageBlocState {}

class InitPageLoading extends InitPageBlocState {}

class InitPageLoaded extends InitPageBlocState {
	final List<Group> groups;

  InitPageLoaded({required this.groups});
}

class InitPageError extends InitPageBlocState {
	final String errorMessage;

  InitPageError({required this.errorMessage});
}

class InitPageSetupFinished extends InitPageBlocState {}
