import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_stylish_eccomerce/counter_provider.dart';

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
      home: ChangeNotifierProvider<CounterProvider>(
           create: (context) => CounterProvider(),
           child: const NewHomePage(),
           ),
    );
  }
}

class NewHomePage extends StatelessWidget {
  const NewHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterProvider counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('New Home page classs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // Consumer<CounterProvider>(
            //   builder: (context, value, child) {
            //     print("new counter state");
            //     return Text('${value.counter}');
            //   },
            // ),
            Selector<CounterProvider, int>(
                builder: (context, value, child) {
                  print("new counter state");
                  return Text('${value}');
                },
                selector: (context, value) => value.counter),
            TextButton(
              onPressed: () {
                counterProvider.cangeText();
              },
              child: Text("Press me"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterProvider.inCreaseCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// state management
//     provider   --> recmmend by flutter team
//     flutter_bloc 
//     Getx   ---> 
//     