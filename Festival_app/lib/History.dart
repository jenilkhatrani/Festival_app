

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  void initState() {
    // TODO: implement initState
    super.initState();
    loadImage();
  }
  List<File> editedImage = [];
  Future<void> loadImage() async {
    List<File> loadImage = await getHistory();
    setState(() {
      editedImage = loadImage;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        title: Text(
          'History Page',
          style: TextStyle(
            color: Colors.grey.shade200,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.black, Colors.grey],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          TextButton(onPressed: (){
            setState(() {
            editedImage.clear();
            });

          }, child: Text('Clear all')),
          Expanded(
            child: ListView.builder(
              itemCount: editedImage.length,
                itemBuilder: (context , index){
              return Image.file(File(editedImage[index].path));
            }),
          )
        ],
      ),
    );
  }
  Future<List<File>> getHistory() async {
    List<File> editedImage = [];
    Directory? directory = await getApplicationDocumentsDirectory();
    List<FileSystemEntity> files = directory.listSync(recursive: true);
    for (FileSystemEntity file in files) {
      if (file is File && file.path.endsWith('.jpg')) {
        editedImage.add(file);
      }
    }
    return editedImage;
  }
}
