import 'package:http/http.dart' as http;

import 'package:antpack_flutter_app/data/repositories/user/models/user_model.dart';
import 'package:antpack_flutter_app/domain/entities/user.dart';
import 'package:antpack_flutter_app/domain/repositories/user_repository.dart';

class HttpApiUserRepository implements UserRepository {
  HttpApiUserRepository({
    required http.Client client,
    required String baseUrl,
  })  : this._client = client,
        this._baseUrl = baseUrl;

  final http.Client _client;
  final String _baseUrl;

  @override
  Future<List<User>> getUsers() async {
    print('The app is running with URL: $_baseUrl');

    final url = Uri.parse('$_baseUrl/users');
    final response = await _client.get(url);

    if (response.statusCode != 200) {
      throw Exception('Api Error: ${response.statusCode}');
    }

    final jsonListUsers = response.body;

    return UserModel.fromRawJson(jsonListUsers);
  }
}
