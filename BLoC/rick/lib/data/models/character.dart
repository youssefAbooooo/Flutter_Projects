class Character {
  late int id;
  late String name;
  late String statusDeadOrAlive;
  late String kind;
  late String gender;
  late String image;
  late List<dynamic> apperanceEpisodesLink;
  late String origin;
  late String location;
  late String timeCreated;

  ///! I made this List to solve a problem
  ///? which is that the list apperanceEpisodesLink has links to the episodes not the number of the episodes
  ///? So, I made an empty list and called it apperanxeEpisodesNumber and made a for loop in the constructor
  ///? the For loop gets the number that in the link in the apperanceEpisodesLink and add it to the apperanxeEpisodesNumber
  ///? So, apperanxeEpisodesNumber will be equal ['1','2','3'] for each character
  List<String> apperanxeEpisodesNumber = [];

  Character.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    statusDeadOrAlive = json['status'];
    kind = json['species'];
    gender = json['gender'];
    image = json['image'];
    apperanceEpisodesLink = json['episode'];
    origin = json['origin']['name'];
    location = json['location']['name'];
    timeCreated = json['created'];

    ///! How it work?
    ///? I get the characters from the character 40 and add it to the new empty list
    for (String episode in apperanceEpisodesLink) {
      apperanxeEpisodesNumber.add(episode.substring(40));
    }
  }
}
