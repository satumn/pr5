import 'package:flutter/material.dart';
import 'platform_detector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Cat's restaurant"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double counter = 0;
  void feedFish() {
    setState(() {
      if (counter < 10) {
        counter++;
      }
    });
  }
  void feedMilk() {
    setState(() {
      if (counter < 10) {
        counter += 0.5;
      }
    });
  }
  void Cleen() {
    setState(() {
      counter=0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:
      Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Satiety scale $counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(),
                    counter > 5
                        ? Image.network(
                      "https://cdn0.iconfinder.com/data/icons/cat-pattern/94/cat4-512.png", height: 300, width: 300,
                    )
                        : Image.network(
                      "https://static.thenounproject.com/png/1248334-200.png", height: 340, width: 340,
                    ),

                  ],
                ),
                PlatformTypeApp(feedFish: feedFish, feedMilk: feedMilk),
              ]
          ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: Cleen,
        label: const Text('10 hours later'),
      ),
    );
  }
}
