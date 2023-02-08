import 'package:bloc/bloc.dart';
import 'package:bloc_swapi/repositories/person_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../models/people_model.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonRepository _personRepository;

  PersonBloc(this._personRepository) : super(PersonLoadingState()) {
    on<LoadPersonEvent>((event, emit) async {
      emit(PersonLoadingState());
      try {
        final people = await _personRepository.getPeople();
        emit(PersonLoadedState(people));
      } catch (e) {
        emit(PersonErrorState(e.toString()));
      }
    });
  }
}
