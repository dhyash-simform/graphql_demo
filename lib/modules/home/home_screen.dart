import 'package:flutter/material.dart';

import '../../examples/mutation/mutation_example.dart';
import '../../examples/query/query_example.dart';
import 'widgets/gradient_background.dart';
import 'widgets/home_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  static final List<Widget> examples = [
    const QueryExample(),
    MutationExample(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentIndex == 0 ? 'Query' : 'Mutation'),
      ),
      body: GradientBackground(
        child: IndexedStack(
          index: currentIndex,
          children: examples,
        ),
      ),
      bottomNavigationBar: HomeNavBar(
        currentIndex: currentIndex,
        onChanged: (value) => setState(() => currentIndex = value),
      ),
    );
  }
}
