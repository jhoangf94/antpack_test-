import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:antpack_flutter_app/domain/entities/user.dart';
import 'package:antpack_flutter_app/domain/usecases/get_user.dart';

part 'home_page_events.dart';
part 'home_page_states.dart';

class HomePageBloc extends Bloc<HomePageEvents, HomePageState> {
  HomePageBloc({
    required GetUsers getUsers,
  })  : this._getUsers = getUsers,
        super(HomePageInitialState());

  final GetUsers _getUsers;

  @override
  Stream<HomePageState> mapEventToState(HomePageEvents event) async* {
    if (event is LoadUsers) {
      yield* _mapLoadUsersToState();
    }
  }

  Stream<HomePageState> _mapLoadUsersToState() async* {
    try {
      yield LoadingUsers();
      final users = await _getUsers();
      yield LoadedUsers(users: users);
    } catch (e) {
      yield ErrorLoadingUsers();
    }
  }
}
