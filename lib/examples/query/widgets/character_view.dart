import 'package:flutter/material.dart';

import 'character_tile.dart';

class CharacterView extends StatelessWidget {
  const CharacterView({
    required this.charactersView,
    required this.itemCount,
    required this.onItemBuild,
    required this.childrens,
    super.key,
  });

  final PageStorageKey<String> charactersView;
  final int itemCount;
  final (String? image, String? name) Function(int index) onItemBuild;
  final List<Widget> childrens;

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: charactersView,
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 8 / 10,
          ),
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          itemCount: itemCount,
          itemBuilder: (_, index) => CharacterTile(
            profilePic: onItemBuild(index).$1 ?? '',
            name: onItemBuild(index).$2 ?? '',
          ),
        ),
        ...childrens,
      ],
    );
  }
}
