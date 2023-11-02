import '../../model/character.dart';

class CharacterHelper {
  factory CharacterHelper() => instance;

  CharacterHelper._();

  static final instance = CharacterHelper._();

  List<Character> toCharacters(Map<String, dynamic> data) {
    return (data as List<dynamic>)
        .map((e) => Character.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
