import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Refresh Indicator',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 74),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _itens = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refresh Indicator'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            _itens.add('Item ${_itens.length + 1}');
          });
        },
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(_itens[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
