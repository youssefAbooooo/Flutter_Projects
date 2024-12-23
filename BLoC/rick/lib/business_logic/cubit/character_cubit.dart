import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../data/models/character.dart';
import '../../data/repository/characters_repository.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit({required this.charactersRepository})
      : super(CharacterInitial());
  CharactersRepository charactersRepository;
  // List<Character> characters = [];
  // late Location location;

  void getAllCharacters() {
    ///! just get the List of Characters from the repository
    ///! and emit the State with the List to the UI
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters: characters));
      // this.characters = characters;
    });
    // return characters;
  }
}
