import 'dart:async';
import 'package:contact_dairy/utils/image_utils.dart';
import 'package:contact_dairy/utils/routes_utils.dart';
import 'package:contact_dairy/views/screen/contact_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

void screenchanges() {
  Timer.periodic(const Duration(seconds: 3), (tick) {});
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool dark = false;
  int n = 100;
  bool grid = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        myroutes.contacts: (context) => const contacts(),
      },
      theme: ThemeData(
        useMaterial3: true,
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: Colors.red,
            fontSize: 20,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: dark ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Contact Dairy",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  dark = !dark;
                });
              },
              icon: Icon(
                  dark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  grid = !grid;
                });
              },
              icon: Icon(grid ? Icons.grid_view : Icons.list),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Scrollbar(
            thickness: 15,
            radius: const Radius.circular(50),
            interactive: true,
            child: grid
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemCount: n,
                    itemBuilder: (context, index) {
                      return Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (val) {},
                              icon: Icons.call,
                              backgroundColor: Colors.green,
                            ),
                            SlidableAction(
                              onPressed: (val) {},
                              icon: Icons.edit,
                              backgroundColor: Colors.black,
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 22,
                            backgroundColor:
                                Colors.primaries[index % 18].shade200,
                            foregroundImage:
                                NetworkImage(images[index % images.length]),
                            child: Text("${index + 1}"),
                          ),
                          title: Text(
                            "Title ${index + 1}",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: n,
                    itemBuilder: (context, index) {
                      return Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (val) {},
                              icon: Icons.call,
                              backgroundColor: Colors.green,
                            ),
                            SlidableAction(
                              onPressed: (val) {},
                              icon: Icons.edit,
                              backgroundColor: Colors.black,
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 22,
                            backgroundColor:
                                Colors.primaries[index % 18].shade200,
                            foregroundImage:
                                NetworkImage(images[index % images.length]),
                            child: Text("${index + 1}"),
                          ),
                          title: Text(
                            "Title ${index + 1}",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).pushNamed(myroutes.contacts);
            setState(() {});
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
