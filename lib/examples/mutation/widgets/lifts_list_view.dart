import 'dart:async';

import 'package:flutter/material.dart';

import '../../../schemas/moon_high_way/operations/gql_operations.dart';
import 'gd_segment_btn.dart';

class LiftsListView extends StatelessWidget {
  const LiftsListView({
    required this.onRefresh,
    required this.currentValue,
    required this.statusNotifier,
    required this.onTabChange,
    required this.itemCount,
    required this.onItemBuild,
    super.key,
  });

  final Future<void> Function() onRefresh;
  final EnumLiftStatus currentValue;
  final ValueNotifier<EnumLiftStatus> statusNotifier;
  final FutureOr<void> Function(EnumLiftStatus) onTabChange;
  final int itemCount;
  final Widget Function(int index) onItemBuild;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GDSegmentBtn(
            currentValue: currentValue,
            onSelectionChanged: (EnumLiftStatus value) async {
              statusNotifier.value = value;
              await onTabChange(value);
            },
          ),
          const SizedBox(height: 20),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            itemCount: itemCount,
            itemBuilder: (_, index) => onItemBuild(index),
            separatorBuilder: (_, __) => const SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}
