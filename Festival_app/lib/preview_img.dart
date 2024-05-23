import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'main.dart';

class PreviewImg extends StatefulWidget {
  final Uint8List imgBytes;

  const PreviewImg({super.key, required this.imgBytes});

  @override
  State<PreviewImg> createState() => _PreviewImgState();
}

class _PreviewImgState extends State<PreviewImg> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
        ),
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            InkWell(
              onLongPress: (){
                imagelist.length;
              },
              child: Image.memory(
                widget.imgBytes,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}