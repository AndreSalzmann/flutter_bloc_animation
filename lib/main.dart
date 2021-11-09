import 'package:animated_list/bloc/data_bloc.dart';
import 'package:animated_list/widgets/UserListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UserModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final listData = [
    UserModel(0, 'Govind', 'Dixit'),
    UserModel(1, 'Greta', 'Stoll'),
    UserModel(2, 'Monty', 'Carlo'),
    UserModel(3, 'Petey', 'Cruiser'),
    UserModel(4, 'Barry', 'Cade'),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBloc(listData: listData),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedListDemo(),
      ),
    );
  }
}

class AnimatedListDemo extends StatefulWidget {
  const AnimatedListDemo({Key key}) : super(key: key);
  static String routeName = '/misc/animated_list';

  @override
  _AnimatedListDemoState createState() => _AnimatedListDemoState();
}

class _AnimatedListDemoState extends State<AnimatedListDemo>
    with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {

    final bloc = BlocProvider.of<DataBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedList'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: bloc.addUser,
          ),
        ],
      ),
      body: SafeArea(
        child: AnimatedList(
          key: bloc.listKey,
          initialItemCount: bloc.listData.length,
          itemBuilder: (context, index, animation) {
            return FadeTransition(
              opacity: animation,
              child: UserListTile(user: bloc.listData[index]),
            );
          },
        ),
      ),
    );
  }


}

