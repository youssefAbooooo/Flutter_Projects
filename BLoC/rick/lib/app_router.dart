import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/character_cubit.dart';
import 'data/models/character.dart';
import 'data/repository/characters_repository.dart';
import 'data/web_services/character_web_services.dart';
import 'presentation/screens/character_details_screen.dart';
import 'presentation/screens/characters_screen.dart';

const charactersScreen = '/';
const characterDetailsScreen = '/character_details';

class AppRouter {
  ///! We need the cubit to send the data to the UI
  ///! and the cubit need the repository to get the data.
  ///! that is why we should create an object of the CharactersRepository and an Object of the CharacterCubit
  late CharactersRepository charactersRepository;
  late CharacterCubit characterCubit;

  AppRouter() {
    charactersRepository =
        CharactersRepository(characterWebServices: CharacterWebServices());
    characterCubit = CharacterCubit(charactersRepository: charactersRepository);
  }

  ///? the settings attribute have two main variables :
  ///? name which is the name of the route
  ///? arguments which is the arguments that can be passed

  Route? generateRoute(RouteSettings settings) {
    //? name example
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => characterCubit,
            child: const Charactersscreen(),
          ),
        );
      case characterDetailsScreen:
        //? arguments example
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(character: character));
    }
    return null;
  }
}
