part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {}

class HomePageInitialState extends HomePageState {
  @override
  List<Object?> get props => [];
}

class LoadingUsers extends HomePageState {
  @override
  List<Object?> get props => [];
}

class ErrorLoadingUsers extends HomePageState {
  @override
  List<Object?> get props => [];
}

class LoadedUsers extends HomePageState {
  LoadedUsers({
    required this.users,
  });

  final List<User> users;

  @override
  List<Object?> get props => [users];
}
