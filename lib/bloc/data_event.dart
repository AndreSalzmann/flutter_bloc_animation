part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();

  Stream<DataState> applyAsync({
    DataBloc bloc,
  });
}


class MoveToEndEvent extends DataEvent {

  final UserModel userModel;
  final int id;

  MoveToEndEvent({this.userModel, this.id});

  @override
  Stream<DataState> applyAsync({DataBloc bloc}) async* {
    UserModel user = bloc.deleteUser(id);
    yield DataDeleteState();
    bloc.addUser(userModel: user);
    yield DataAddState();
  }

  @override
  List<Object> get props => throw UnimplementedError();

}
