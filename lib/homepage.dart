import 'package:bloc_swapi/repositories/person_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/person/person_bloc.dart';
import 'models/people_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonBloc>(
          create: (BuildContext context) => PersonBloc(PersonRepository()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('SWApi bloc')),
        body: homepageBody(),
      ),
    );
  }
}

Widget homepageBody() {
  return BlocProvider(
    create: (context) => PersonBloc(
      PersonRepository(),
    )..add(LoadPersonEvent()),
    child: BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) {
        if (state is PersonLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PersonLoadedState) {
          List<PersonModel> personList = state.people;
          return ListView.builder(
            itemCount: personList.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: ListTile(
                    title: Text('${personList[index].name}',
                        style: const TextStyle(color: Colors.white)),
                    subtitle: Text(
                      '${personList[index].birthYear}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          );
        }
        if (state is PersonErrorState) {
          return const Center(
            child: Text("Error"),
          );
        }
        return Container();
      },
    ),
  );
}
