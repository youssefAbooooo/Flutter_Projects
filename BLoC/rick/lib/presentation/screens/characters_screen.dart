import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../business_logic/cubit/character_cubit.dart';
import '../../constants/my_colors.dart';
import '../../data/models/character.dart';
import '../widgets/character_item.dart';

class Charactersscreen extends StatefulWidget {
  const Charactersscreen({super.key});

  @override
  State<Charactersscreen> createState() => _CharactersscreenState();
}

class _CharactersscreenState extends State<Charactersscreen> {
  late List<Character> allCharacters;
  late List<Character> searchedForCharacter;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      //! Controlls the data in the TextField
      controller: _searchTextController,
      cursorColor: MyColors
          .myGrey, //? color of the cursor that is after the last letter you typed in the text field
      decoration: const InputDecoration(
          hintText: 'Find a Character...',
          hintStyle: TextStyle(
            color: MyColors.myGrey,
            fontSize: 18,
          )),
      style: const TextStyle(
        //? style of the text that is in the text field

        color: MyColors.myGrey,
        fontSize: 18,
      ),
      onChanged: (searchedCharacter) {
        //? searchedCharacter is the text the is being typed in the text field

        addSearchedCharactersToSearchedForCharacterList(searchedCharacter);
      },
    );
  }

  void addSearchedCharactersToSearchedForCharacterList(
      String searchedCharacter) {
    ///? this line mean : the character will be added to searchedForCharacter
    ///? if the character.name startsWith what is being typed in the text field
    searchedForCharacter = allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    ///? if you are searching then display the clear icon
    ///? else display the search icon
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearching();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: MyColors.myGrey,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearching,
          icon: const Icon(
            Icons.search,
            color: MyColors.myGrey,
          ),
        ),
      ];
    }
  }

  void _startSearching() {
    ///? this line makes like you are navigating to a new screen
    ///? and will make the defalut back icon of flutter appear
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true; //? if you started searching then _isSearching = true
    });
  }

  void _stopSearching() {
    _clearSearching(); //? when you stop searching clear the data in the text field
    setState(() {
      _isSearching =
          false; //? if you finished searching then _isSearching = false
    });
  }

  void _clearSearching() {
    setState(() {
      _searchTextController.clear(); //! clears the data in the TextField
    });
  }

  @override
  void initState() {
    super.initState();

    ///! It is used to access an instance of a Bloc or Cubit that has been
    ///! provided higher up in the widget tree using a BlocProvider.
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;
          return buildLoadedListWidget();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharacterList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _searchTextController.text.isEmpty
          ? allCharacters.length
          : searchedForCharacter.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: _searchTextController.text.isEmpty
              ? allCharacters[index]
              : searchedForCharacter[index],
        );
      },
    );
  }

  Widget _buildAppBarTitle() {
    return const Text(
      'Characters',
      style: TextStyle(color: MyColors.myGrey),
    );
  }

  Widget buildOffLineWidget() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Can\'t connect .. Check Internet',
              style: TextStyle(fontSize: 22, color: MyColors.myGrey),
            ),
            Image.asset('assets/images/undraw_going_offline_ihag.png')
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        leading: _isSearching
            ? const BackButton(color: MyColors.myGrey)
            : Container(),
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          List<ConnectivityResult> connectivity,
          Widget child,
        ) {
          final bool connected =
              !connectivity.contains(ConnectivityResult.none);
          if (connected) {
            return buildBlocWidget();
          } else {
            return buildOffLineWidget();
          }
        },
        child: showLoadingIndicator(),
      ),
      backgroundColor: MyColors.myGrey,
    );
  }
}
