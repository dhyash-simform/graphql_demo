import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({
    required this.profilePic,
    required this.name,
    super.key,
  });

  final String profilePic;
  final String name;

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
                image: NetworkImage(profilePic),
              ),
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.all(
                Radius.circular(26),
              ),
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
          name,
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
