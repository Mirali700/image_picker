import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: unused_field
  File ? _selectedImage;
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body:  Column(
          
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  child: _selectedImage == null ? Image.network("https://cdn.pixabay.com/photo/2024/01/15/11/36/batman-8510022_640.png"): Image.file(_selectedImage!),
                 
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [TextButton(onPressed: (){
               _pickImageFromGallery();
              }, child: const Text("Select"))],),
          ],
        ),
      ),
    );
  }
  // ignore: unused_element
  Future _pickImageFromGallery()async{
    final returnedImage= await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage=File(returnedImage!.path);
    });
  }
  // ignore: unused_element
  Future _pickImageFromCamera()async{
    final returnedImage= await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
     _selectedImage=File(returnedImage!.path);
    });
  }
}
