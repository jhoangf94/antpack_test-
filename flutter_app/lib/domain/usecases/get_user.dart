import 'package:antpack_flutter_app/domain/entities/user.dart';
import 'package:antpack_flutter_app/domain/repositories/user_repository.dart';

class GetUsers {
  GetUsers({
    required repository,
  }) : this._repository = repository;

  final UserRepository _repository;

  Future<List<User>> call() async {
    final users = await _repository.getUsers();
    return users;
  }
}
