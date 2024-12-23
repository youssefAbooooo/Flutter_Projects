part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}

class CharactersLoaded extends CharacterState {
  ///! when the data is loaded recieve the List of Objects
  final List<Character> characters;

  CharactersLoaded({required this.characters});
}

class CharactersError extends CharacterState {
  //Do something when there is an error
}
