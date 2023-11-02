import 'package:flutter/material.dart';

import '../../examples/mutation/mutation_example.dart';
import '../../examples/query/query_example.dart';
import '../../examples/subscription/subscription_example.dart';
import '../../values/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          /// In-order to use client in Query and Mutation
          ///
          // TODO(Task-2): wrap Client with Provider
          const QueryExample(),
          MutationExample(),
          const SubscriptionExample(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() => currentIndex = value),
        currentIndex: currentIndex,
        backgroundColor: AppColors.black,
        unselectedItemColor: Colors.white30,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Query',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Mutation',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Subscription',
          ),
        ],
      ),
    );
  }
}
