import 'package:counter/counter_provider.dart';
import 'package:counter/counter_store.dart';
import 'package:counter/secondpage.dart';
import 'package:counter/thirdpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CounterProvider(33),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  List<BottomNavigationBarItem> button = [
    const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Second"),
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Third")
  ];

  List page = [
    const SecondPage(),
    const ThirdPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterProvider>(builder: (_, counterProvider, __) {
              return Text(
                '${counterProvider.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final counterProvider =
              Provider.of<CounterProvider>(context, listen: false);
          counterProvider.incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: button,
        onTap: (value) async {
          var route =
              MaterialPageRoute(builder: (BuildContext context) => page[value]);
          await Navigator.of(context).push(route);
          setState(() {});
        },
      ),
    );
  }
}
