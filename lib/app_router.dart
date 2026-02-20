import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_app/business_logic/cubit/characters_cubit.dart';
import 'package:rickandmorty_app/constants/strings.dart';
import 'package:rickandmorty_app/data/repo/characters_repository.dart';
import 'package:rickandmorty_app/data/web_services/characters_web_services.dart';
import 'package:rickandmorty_app/presentation/screens/character_details_screen.dart';
import 'package:rickandmorty_app/presentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
      //   case '/':
      //     return MaterialPageRoute(builder: (_) => CharactersScreen());

      default:
        return null;
    }
  }
}
