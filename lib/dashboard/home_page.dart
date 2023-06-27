import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:first_app/dashboard/secondPage.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;

    if (appState.favorites.contains(pair)) {
      icon = Icons.star;
    } else {
      icon = Icons.star_border;
    }

    return Scaffold(
      bottomNavigationBar: GNav(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          gap: 8,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.favorite_border,
              text: "Favorite",
            ),
            GButton(
              icon: Icons.settings_outlined,
              text: "Setting",
            )
          ]),
      backgroundColor: Color.fromARGB(255, 255, 212, 58),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Hero(
                tag: "images/denji.jpg",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    "images/denji.jpg",
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text('Hello World:'),
                  BigCard(pair: pair),
                  SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ElevatedButton.icon(
                      //     onPressed: () {
                      //       appState.togglefavorites();
                      //     },
                      //     style: TextButton.styleFrom(
                      //         primary: Color.fromARGB(255, 255, 255, 255),
                      //         backgroundColor: Colors.black),
                      //     icon: Icon(icon,
                      //         color: Color.fromARGB(255, 244, 212, 54)),
                      //     label: Text("like")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Go Back")),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: () {
                            appState.getNext();
                          },
                          child: Text('Next'),
                          style: TextButton.styleFrom(
                              primary: Color.fromARGB(255, 255, 255, 255),
                              backgroundColor: Colors.black)),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondPage(
                                  title: ("CHAINSAW MAN"),
                                  description:
                                      ("Following a betrayal, a young man left for the dead is reborn as a powerful devil-human hybrid after merging with his pet devil and is soon enlisted into an organization dedicated to hunting devils.")),
                            ),
                          );
                        },
                        child: Text('Next Screen'),
                        style: TextButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 255, 255),
                            backgroundColor: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.primary);
    return Card(
      color: theme.colorScheme.onPrimary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: TextStyle(fontFamily: 'Antan'),
          semanticsLabel: pair.asPascalCase,
        ),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = <WordPair>[];

  void togglefavorites() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}
