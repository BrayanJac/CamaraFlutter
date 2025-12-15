import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/foto_provider.dart';
import 'views/home_view.dart';
import 'views/foto_view.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FotoProvider()),
    ],
  child: MyApp(),
  ),);
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  //indicar que la pantalla
  int index = 0;

  //pantallas
  final screens = [
    HomeView(),
    FotoView(),
    //PerfilView(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: screens[index],
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: "Foto"),
        ],
      ),
      )
    );
  }
}