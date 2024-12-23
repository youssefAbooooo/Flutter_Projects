import 'package:dio/dio.dart';
import '../../constants/strings.dart';

class CharacterWebServices {
  late Dio dio;

  //? this code in the constructor is executed when Object is created from this Class.
  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      //! baseURL = 'https://rickandmortyapi.com/api/'
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    dio = Dio(options);
  }

  //! this function fetches the data from the internet using dio Package
  Future<List<dynamic>> getAllCharacters() async {
    try {
      //! the ..... of the request    :  character
      Response response = await dio.get('character');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> characters = jsonData['results'];
      return characters;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return [];
    }
  }
}
