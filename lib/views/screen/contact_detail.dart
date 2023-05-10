import 'dart:io';

import 'package:contact_dairy/views/component/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/globallist.dart';
import '../../utils/globals.dart';

class contacts extends StatefulWidget {
  const contacts({Key? key}) : super(key: key);

  @override
  State<contacts> createState() => _contactsState();
}

class _contactsState extends State<contacts> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  File? image;
  String? name;
  String? email;
  String? contact;
  @override
  Widget build(BuildContext context) {
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
                print(name);
                Globallist.allcontact.add(
                  Globalvar(
                    name: name!,
                    email: email!,
                    phone: contact!,
                  ),
                );
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
                            image != null ? FileImage(image!) : null,
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
                      name = val;
                    },
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
                      email = val;
                    },
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
                      contact = val;
                    },
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
