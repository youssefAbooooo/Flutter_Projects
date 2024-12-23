class Object {
  const Object(
      {required this.sound,
      required this.textInEnglish,
      this.image,
      required this.textInJapanese});

  final String sound;
  final String textInJapanese;
  final String textInEnglish;
  final String? image;
}
