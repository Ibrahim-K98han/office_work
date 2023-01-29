import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen/provider.dart';
import 'home.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers:[
    ChangeNotifierProvider(create: (context)=>EmployeeInfoData())
  ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
