import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../model/character.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({
    required this.character,
    super.key,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
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
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(26),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10,
                ),
                child: ColoredBox(
                  color: Colors.white24,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      character.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
