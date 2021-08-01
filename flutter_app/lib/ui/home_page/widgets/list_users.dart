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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 32,
            child: Text(user.nameFirstCharacter),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}, ${user.city}',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text('${user.email}',
                    style: Theme.of(context).textTheme.subtitle1),
                Text('${user.companyName}', style: labelTheme),
                SizedBox(height: 10),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
