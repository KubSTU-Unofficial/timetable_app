import 'package:flutter_bloc/flutter_bloc.dart';

part 'init_page_block_event.dart';
part 'init_page_bloc_state.dart';

class InitPageBloc extends Bloc<InitPageBlockEvent, InitPageBlocState> {
  InitPageBloc() : super(InitPageInitial()) {
    on<loudGroupsEvent>((event, emit) {

    });
  }
}
