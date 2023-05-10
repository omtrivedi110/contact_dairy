import 'package:contact_dairy/utils/globallist.dart';
import 'package:contact_dairy/utils/globals.dart';
import 'package:contact_dairy/utils/image_utils.dart';
import 'package:contact_dairy/utils/routes_utils.dart';
import 'package:contact_dairy/views/screen/contact_detail.dart';
import 'package:contact_dairy/views/screen/contacteditpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.red,
  //   ),
  // );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool dark = false;
  bool grid = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // textTheme: const TextTheme(
        //   displayMedium: TextStyle(
        //     color: Colors.red,
        //     fontSize: 20,
        //   ),
        // ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: dark ? Brightness.dark : Brightness.light,
        useMaterial3: true,
      ),
      routes: {
        myroutes.contacts: (context) => const contacts(),
        myroutes.editpage: (context) => const editpage(),
        myroutes.home: (context) => Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        dark = !dark;
                      });
                    },
                    icon: Icon(dark
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        grid = !grid;
                      });
                    },
                    icon: Icon(grid
                        ? Icons.view_list_outlined
                        : Icons.grid_on_outlined),
                  ),
                ],
                centerTitle: true,
                title: const Text(
                  "Contact Diary",
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: (Globallist.allcontact.isEmpty)
                    ? const Center(
                        child: Text(
                          "Enter The Contact",
                          style: TextStyle(fontSize: 30, color: Colors.grey),
                        ),
                      )
                    : grid
                        ? GridView.builder(
                            itemCount: Globallist.allcontact.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 2 / 3,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                            ),
                            itemBuilder: (context, index) => Slidable(
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (val) {
                                      Uri call = Uri(
                                        scheme: 'tel',
                                        path:
                                            Globallist.allcontact[index].phone,
                                      );
                                      launchUrl(call);
                                    },
                                    icon: Icons.call,
                                    backgroundColor: Colors.green,
                                  ),
                                  SlidableAction(
                                    onPressed: (val) {},
                                    icon: Icons.edit,
                                    backgroundColor: Colors.blue,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  foregroundImage:
                                      NetworkImage(images[index % 5]),
                                  child: Text("${index + 1}"),
                                ),
                                title: Text("${index + 1}"),
                                subtitle: Text("$index"),
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: Globallist.allcontact.length,
                            itemBuilder: (context, index) => Slidable(
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (val) async {
                                      Uri call = Uri(
                                        scheme: 'tel',
                                        path:
                                            Globallist.allcontact[index].phone,
                                      );
                                      launchUrl(call);
                                    },
                                    icon: Icons.call,
                                    backgroundColor: Colors.green,
                                  ),
                                  SlidableAction(
                                    onPressed: (val) async {
                                      await Navigator.of(context).pushNamed(
                                          myroutes.editpage,
                                          arguments: index);
                                      setState(() {});
                                    },
                                    icon: Icons.edit,
                                    backgroundColor: Colors.blue,
                                  ),
                                ],
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  foregroundImage:
                                      NetworkImage(images[index % 5]),
                                  child: Text("${index + 1}"),
                                ),
                                title: Text(
                                    "${Globallist.allcontact[index].name}"),
                                subtitle: Text(
                                    "${Globallist.allcontact[index].phone}"),
                              ),
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
      },
    );
  }
}
