import 'dart:io';

import 'package:festival_app/History.dart';
import 'package:festival_app/editor_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pro_image_editor/modules/main_editor/main_editor.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
}

List<String> imagelist = [
  'assets/images/kan.jpg',
  'assets/images/1.jpg',
  'assets/images/christmas.jpg',
  'assets/images/diwali.webp',
  'assets/images/ganesh.jpg',
  'assets/images/navratri.jpg',
  'assets/images/rakhi.jpg',
  'assets/images/shiv.webp',
  'assets/images/uttrayan.jpg',
  'assets/images/fair.jpg',
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with ExampleHelperState<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.manage_history_outlined, color: Colors.grey.shade200, size: 30),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        elevation: 5,
        centerTitle: true,
        title: Text(
          'Festival App',
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.black,
              Colors.black54,
              Colors.black12,
              Colors.black12,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Select any Festival',
                  style: TextStyle(color: Colors.grey, fontSize: 30),
                ),
              ),
              SizedBox(height: 20),
              GridView.count(
                padding: EdgeInsets.all(5),
                mainAxisSpacing: 10,
                crossAxisCount: 2, // Changed to 2 to better utilize the screen space
                crossAxisSpacing: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(imagelist.length, (index) {
                  return InkWell(
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return ProImageEditor.asset(
                          imagelist[index],
                          onImageEditingComplete: onImageEditingComplete,
                          onCloseEditor: onCloseEditor,
                          allowCompleteWithEmptyEditing: true,
                        );
                      }));
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset(imagelist[index], fit: BoxFit.fill),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(

          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Center(
                child: Text(
                  'Edited History',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => History()) );
              },
              child: Text('Historyyy',style: TextStyle(fontSize: 25,color: Colors.blueGrey,),
            ),

            )  // Add drawer items here
          ],
        ),
      ),
    );
  }

}
