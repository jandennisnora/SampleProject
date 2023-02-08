part of 'person_bloc.dart';

@immutable
abstract class PersonState extends Equatable {
  // const PersonState();
}

//data loading state
class PersonLoadingState extends PersonState {
  @override
  List<Object> get props => [];
}

class PersonLoadedState extends PersonState {
  final List<PersonModel> people;
  PersonLoadedState(this.people);

  @override
  List<Object?> get props => [people];
}

class PersonErrorState extends PersonState {
  final String error;
  PersonErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
// class PersonInitial extends PersonState {}
