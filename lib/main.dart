import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Image Picker Demo',
      home: MyHomePage(title: 'Image Picker Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: _imageFile != null
            ? Image.file(File(_imageFile!
                .path)) // TODO: ZStack med billede med ruunde hjørner og _imageFile.name og creationDate
            : const Text('Ingen Image valgt'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final XFile? pickedFile =
                await _picker.pickImage(source: ImageSource.gallery);
            setState(() {
              _imageFile = pickedFile;
            });
          } catch (e) {
            Error();
          }
        },
        heroTag: 'image0',
        tooltip: 'Vælg et billede fra PhotoLibrary',
        child: const Icon(Icons.photo),
      ),
    );
  }
}
