import 'package:flutter/material.dart';

import '../../../model/character/character.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({
    required this.character,
    super.key,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(character.image),
              ),
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(26),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 5),
                  spreadRadius: -12,
                  blurRadius: 20,
                ),
              ],
            ),
          ),
        ),
        Text(
          character.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
