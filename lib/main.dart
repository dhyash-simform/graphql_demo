import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'app_widget.dart';

Future<void> main() async {
  await initHiveForFlutter();
  runApp(const AppWidget());
}
