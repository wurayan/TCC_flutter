import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partiu_app/Utils/Colors.dart';
import 'package:partiu_app/Utils/utils.dart';
import 'package:partiu_app/models/user.dart';
import 'package:partiu_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AddEventoScreen extends StatefulWidget {
  const AddEventoScreen({Key? key}) : super(key: key);

  @override
  State<AddEventoScreen> createState() => _AddEventoScreenState();
}

class _AddEventoScreenState extends State<AddEventoScreen> {
  Uint8List? _file;

  _selectImage(BuildContext context) async {
    return showDialog(context: context, builder: (context) {
      return SimpleDialog(
        title:  const Text("Criar evento"),
        children: [
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text("Tire uma foto"),
            onPressed: () async {
              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.camera);
              setState(() {
                _file = file;
              });
            },
          ),
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text("Escolha da galeria"),
            onPressed: () async {
              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.gallery);
              setState(() {
                _file = file;
              });
            },
          ),
          
        ],
      );
    },);
  }
  @override
  Widget build(BuildContext context) {

    final User user = Provider.of<UserProvider>(context).getUser;
    
    return _file == null ? Center(
      child: IconButton(icon: const Icon(Icons.upload),
      onPressed: () {
        _selectImage(context);
      },),
    )
    : Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(icon: const Icon(Icons.arrow_back),
        onPressed: () {
          
        },),
        title: const Text("Criar evento"),
        centerTitle: false,
        actions: [
          TextButton(onPressed: () {
            
          }, 
          child:  Text("Post",
            style: TextStyle(
              color: Colors.indigo[400],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  user.photoUrl
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.45,
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Descreva seu evento",
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(aspectRatio: 487/451,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: MemoryImage(_file!),
                    fit: BoxFit.fill,
                    alignment: FractionalOffset.topCenter,
                    )
                  ),
                ),),
              ),
              const Divider()
            ],
          )
        ],
      ),
    );
  }
}