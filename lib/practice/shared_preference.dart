import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends StatefulWidget {
  const SharedPreference({super.key});

  @override
  State<SharedPreference> createState() => _SharedPreferenceState();
}

class _SharedPreferenceState extends State<SharedPreference> {
  String name = "";

  int _counter = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   _loadCounter();
  // }

  //Loading counter value on start
  // Future<void> _loadCounter() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _counter = (prefs.getInt('counter') ?? 0);
  //   });
  // }

  // Future<void> _incrementCounter() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     _counter = (prefs.getInt('counter') ?? 0) + 1;
  //     prefs.setInt('counter', _counter);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Column(
      //   // children: [Text(name.toString())],
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     const Text(
      //       'You have pushed the button this many times:',
      //     ),
      //     Text(
      //       '$_counter',
      //       style: Theme.of(context).textTheme.headlineMedium,
      //     ),
      //   ],
      // ),
      // // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
          onPressed: () async {
            SharedPreferences sp = await SharedPreferences.getInstance();

            sp.setString("name", "Vitesh Pawar");
            name = sp.getString("name") ?? "";

            print(sp.getString("name"));

            setState(() {});
          },
          child: Icon(Icons.plus_one),
        ),
      ),
    );
  }
}
