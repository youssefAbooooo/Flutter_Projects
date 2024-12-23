import '../models/character.dart';
import '../web_services/character_web_services.dart';

class CharactersRepository {
  final CharacterWebServices characterWebServices;

  CharactersRepository({required this.characterWebServices});

  ///! this function
  ///! 1 - get the data from the webservices class
  ///! 2 - Convert the data from Map<String,dynamic> to List<Object>
  Future<List<Character>> getAllCharacters() async {
    ///! 1 - get the data from the webservices class
    final characters = await characterWebServices.getAllCharacters();

    ///! this line
    ///! 2 - change the   Map<String,dynamic>  to  (List of Object(Characters))
    return characters
        .map((character) => Character.fromjson(character))
        .toList();
  }
}
