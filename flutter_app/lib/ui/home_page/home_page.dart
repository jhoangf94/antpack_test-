import 'package:antpack_flutter_app/ui/home_page/home_page_bloc/home_page_bloc.dart';
import 'package:antpack_flutter_app/ui/home_page/widgets/error_view.dart';
import 'package:antpack_flutter_app/ui/home_page/widgets/list_users.dart';
import 'package:antpack_flutter_app/ui/home_page/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _loadUsers(BuildContext context) {
    context.read<HomePageBloc>().add(LoadUsers());
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Users'),
      actions: [
        IconButton(
          onPressed: () => _loadUsers(context),
          icon: Icon(
            Icons.replay,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // inject usecase getUser dependency to Bloc and add LoadUsers  event
      create: (_) => HomePageBloc(getUsers: context.read())..add(LoadUsers()),
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: _buildAppBar(context),
            body: BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
                if (state is LoadingUsers) {
                  return Loader();
                } else if (state is LoadedUsers) {
                  return ListUsers(users: state.users);
                } else if (state is ErrorLoadingUsers) {
                  return ErrorView(onPressedTyAgain: () => _loadUsers(context));
                }

                return SizedBox.shrink();
              },
            ),
          );
        },
      ),
    );
  }
}
