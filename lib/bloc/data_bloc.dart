import 'dart:async';

import 'package:animated_list/widgets/UserListTile.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../UserModel.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {

  final GlobalKey<AnimatedListState> listKey = GlobalKey();


  int _maxIdValue = 4;

  List<UserModel> listData;

  DataBloc({this.listData}) : super(DataInitialState());

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    yield* event.applyAsync(bloc: this);
  }

  void addUser({UserModel userModel}) {
    var index = listData.length;

    if(userModel != null) {
      listData.add(userModel,);
    } else {
      listData.add(UserModel(++listData.length, 'New', 'Person'),);
    }
    listKey.currentState
        .insertItem(index, duration: const Duration(milliseconds: 800));
  }


  UserModel deleteUser(int id) {

    final index = listData.indexWhere((u) => u.id == id);
    var user = listData.removeAt(index);

    listKey.currentState.removeItem(index, (context, animation) {
      return UserListTile(user: user,);
    },
  );

  return user;
  }
}
