import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';
import '../../data/models/character.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({super.key, required this.character});

  Widget buildAppBar() {
    return SliverAppBar(
      backgroundColor: MyColors.myYellow,
      stretch: true,
      pinned: true,
      expandedHeight: 600,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name,
        ),
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildCharacterInfo(String title, String info) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
            text: info,
            style: const TextStyle(
              fontSize: 16,
            ))
      ]),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      thickness: 2,
      endIndent: endIndent,
      color: MyColors.myYellow,
      height: 30,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                    margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildCharacterInfo('Name : ', character.name),
                        buildDivider(265),
                        buildCharacterInfo('Kind : ', character.kind),
                        buildDivider(280),
                        buildCharacterInfo(
                            'Status : ', character.statusDeadOrAlive),
                        buildDivider(260),
                        buildCharacterInfo('gender : ', character.gender),
                        buildDivider(255),
                        buildCharacterInfo(
                            'Apperance in episodes : ',
                            //! this join make Makes you add a String between each element in the List
                            character.apperanxeEpisodesNumber.join(' / ')),
                        buildDivider(135),
                        const SizedBox(height: 20),
                        Center(
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 20,
                              color: MyColors.myYellow,
                              shadows: [
                                Shadow(
                                  blurRadius: 7,
                                  color: MyColors.myYellow,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                FlickerAnimatedText(character.name),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 600),
                      ],
                    )),
                // buildDivider(),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: MyColors.myGrey,
    );
  }
}
