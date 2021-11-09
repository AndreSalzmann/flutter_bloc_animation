import 'package:animated_list/bloc/data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../UserModel.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({Key key, this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey<UserModel>(user),
      title: Text(user.firstName),
      subtitle: Text(user.lastName),
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => BlocProvider.of<DataBloc>(context)
            .add(MoveToEndEvent(userModel: user, id: user.id)),
      ),
    );
  }
}

