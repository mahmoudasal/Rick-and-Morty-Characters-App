import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:rickandmorty_app/data/models/character.dart';
import 'package:rickandmorty_app/data/repo/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  void getAllCharacters() {
    emit(CharactersLoading());
    charactersRepository
        .getAllCharacters()
        .then((characters) {
          emit(CharactersLoaded(characters));
          this.characters = characters;
        })
        .catchError((error) {
          emit(CharactersError(error.toString()));
        });
  }
}
