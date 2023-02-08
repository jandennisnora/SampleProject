part of 'person_bloc.dart';

@immutable
abstract class PersonEvent extends Equatable {
  const PersonEvent();
}

class LoadPersonEvent extends PersonEvent {
  @override
  List<Object> get props => [];
}
