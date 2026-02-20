part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

final class CharactersError extends CharactersState {
  final String message;

  CharactersError(this.message);
}

final class CharactersLoading extends CharactersState {}

final class CharactersLoaded extends CharactersState {
  final List<Character> characters;

  CharactersLoaded(this.characters);
}
