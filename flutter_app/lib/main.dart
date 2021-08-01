import 'package:antpack_flutter_app/data/repositories/user/http_api_user_repository.dart';
import 'package:antpack_flutter_app/domain/usecases/get_user.dart';
import 'package:antpack_flutter_app/ui/ant_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

void main() async {
  final baseUrl = _getBaseUrl();

  // instanciate dependencies
  final client = http.Client();

  final repository = HttpApiUserRepository(
    client: client,
    baseUrl: baseUrl,
  );

  runApp(
    // inject usecase to widget tree
    RepositoryProvider(
      create: (_) => GetUsers(repository: repository),
      child: MyApp(),
    ),
  );
}

/// Get from --dart-define=baseUrl="some url" and return
/// if not define return the jsonplaceholder utl
String _getBaseUrl() {
  const jsonPlaceHolderBaseUrl = 'https://jsonplaceholder.typicode.com';

  const baseUrl = String.fromEnvironment(
    'baseUrl',
    defaultValue: jsonPlaceHolderBaseUrl,
  );

  return baseUrl;
}
