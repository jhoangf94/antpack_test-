import 'package:flutter/material.dart';

import 'package:antpack_flutter_app/domain/entities/user.dart';

class ListUsers extends StatelessWidget {
  const ListUsers({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: users.length,
        itemBuilder: (context, i) {
          final user = users[i];
          return _UserCard(user: user);
        },
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final labelTheme = Theme.of(context)
        .textTheme
        .subtitle1
        ?.copyWith(color: Colors.grey[600]);

    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 26,
                child: Text(user.nameFirstCharacter),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.name}, ${user.city}',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text('${user.email}',
                        style: Theme.of(context).textTheme.subtitle1),
                    Text('${user.companyName}', style: labelTheme),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
