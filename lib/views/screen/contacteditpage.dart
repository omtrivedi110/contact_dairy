import 'dart:io';

import 'package:contact_dairy/views/component/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/globallist.dart';
import '../../utils/globals.dart';

class editpage extends StatefulWidget {
  const editpage({Key? key}) : super(key: key);

  @override
  State<editpage> createState() => _editpageState();
}

class _editpageState extends State<editpage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  File? image;
  String? name;
  String? email;
  String? contact;
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              formkey.currentState!.validate();
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(
                  mysnackbar(text: "Successfully Done", color: Colors.green),
                );
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  mysnackbar(text: "Not Validated", color: Colors.red),
                );
              }
            },
            icon: const Icon(Icons.done_outlined),
          )
        ],
        title: const Text("Add Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        foregroundImage:
                            Globallist.allcontact[index].image != null
                                ? FileImage(Globallist.allcontact[index].image!)
                                : image != null
                                    ? FileImage(image!)
                                    : null,
                        child: const Text("Add Image"),
                      ),
                      FloatingActionButton(
                        mini: true,
                        onPressed: () async {
                          ImagePicker picker = ImagePicker();
                          XFile? img = await picker.pickImage(
                              source: ImageSource.camera);
                          image = File(img!.path);
                        },
                        child: const Icon(Icons.add),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter The Name";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (val) {
                      Globallist.allcontact[index].name = val;
                    },
                    initialValue: Globallist.allcontact[index].name,
                    decoration: const InputDecoration(
                      hintText: "Enter Name",
                      label: Text("Name"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter The Email";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (val) {
                      Globallist.allcontact[index].email = val;
                    },
                    initialValue: Globallist.allcontact[index].email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Enter Email",
                      label: Text("Mail"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter The Phone";
                      } else if (val!.length < 10) {
                        return "Enter Right Number";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (val) {
                      Globallist.allcontact[index].phone = val;
                    },
                    initialValue: Globallist.allcontact[index].phone,
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: "Enter Contact Number",
                      label: Text("Number"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
