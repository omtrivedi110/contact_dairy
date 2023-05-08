import 'package:flutter/material.dart';

import '../../utils/globals.dart';

class contacts extends StatefulWidget {
  const contacts({Key? key}) : super(key: key);

  @override
  State<contacts> createState() => _contactsState();
}

class _contactsState extends State<contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 60,
                child: Text("Add Image"),
                // foregroundImage: FileImage(Globalvar.),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              )
            ],
          )
        ],
      ),
    );
  }
}
