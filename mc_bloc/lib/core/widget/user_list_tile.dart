import 'package:flutter/material.dart';
import 'package:mc_bloc/core/extension/app_extension.dart';
import '';

class UserListTile<T> extends StatelessWidget {
  const UserListTile({Key? key, required this.users}) : super(key: key);
  final Iterable<T> users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            users[index].toString(),
          ),
        );
      },
      itemCount: users.length,
    );
  }
}