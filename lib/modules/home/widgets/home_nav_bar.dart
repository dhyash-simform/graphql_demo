import 'package:flutter/material.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    required this.currentIndex,
    required this.onChanged,
    super.key,
  });

  final int currentIndex;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onChanged,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Query',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Mutation',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Subscription',
        ),
      ],
    );
  }
}
