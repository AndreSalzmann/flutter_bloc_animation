part of 'data_bloc.dart';

abstract class DataState extends Equatable {
  const DataState();
}

class DataInitialState extends DataState {

  @override
  List<Object> get props => [];
}

class DataDeleteState extends DataState {
  @override
  List<Object> get props => throw UnimplementedError();

}

class DataAddState extends DataState {
  @override
  List<Object> get props => throw UnimplementedError();

}