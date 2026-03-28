import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'unitecnar 5.0',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('splavia 5.0'),
          actions: [
            IconButton(
              onPressed: () => exit(0),
              icon: const Icon(Icons.logout),
            )
          ],
          leading: const Icon(Icons.home),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$counter',
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Text(
                'Click${counter == 1 ? '' : 's'}',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _CustomButton(
              icon: Icons.refresh,
              onPressed: () {
                setState(() => counter = 0);
              },
            ),
            const SizedBox(height: 10),
            _CustomButton(
              icon: Icons.plus_one,
              onPressed: () {
                setState(() => counter++);
              },
            ),
            const SizedBox(height: 10),
            _CustomButton(
              icon: Icons.exposure_minus_1_rounded,
              onPressed: () {
                if (counter > 0) {
                  setState(() => counter--);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}


class _CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _CustomButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}