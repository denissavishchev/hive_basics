import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class WriteReadDelete extends StatefulWidget {
  const WriteReadDelete({Key? key}) : super(key: key);

  @override
  State<WriteReadDelete> createState() => _WriteReadDeleteState();
}

class _WriteReadDeleteState extends State<WriteReadDelete> {

  final _myBox = Hive.box('myBox');

  void writeData() {
    _myBox.put(1, 'Denis');
  }

  void readData() {
    print(('${_myBox.keys} \n ${_myBox.values}'));
  }

  void deleteData() {
    _myBox.delete(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green
              ),
                onPressed: writeData,
                child: const Text('Write'),),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
              ),
              onPressed: readData,
              child: const Text('Read'),),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red
              ),
              onPressed: deleteData,
              child: const Text('Delete'),),
          ],
        ),
      ),
    );
  }
}
