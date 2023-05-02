import 'package:contact_dairy/views/screen/contact_detail.dart';
import 'package:flutter/material.dart';

void main() {
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'contact_detail': (context) => const contact_detail(),
      },
      theme: ThemeData(
        textTheme: TextTheme(
          displayMedium: TextStyle(
            color: Colors.red,
            fontSize: 20,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Contact Diary",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Text("Contact Dairy App"),
        ),
      ),
    );
  }
}
