import 'package:flutter/material.dart';
import 'package:hive_basics/write_read_delete.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

import 'hive_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('transaction');
  var box = await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
        home: WriteReadDelete());
  }
}

