import 'dart:math';

import 'package:flutter/material.dart';
import 'quotes_data.dart';
import 'quote_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random _random = Random();

  late Quote currentQuote;

  @override
  void initState() {
    super.initState();
    currentQuote = quotes.first;
  }

  void nextQuote() {
    setState(() {
      currentQuote = quotes[_random.nextInt(quotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Quote Generator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Card(
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.format_quote,
                    size: 60,
                    color: Colors.teal,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    currentQuote.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "- ${currentQuote.author}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: nextQuote,
                      icon: const Icon(Icons.refresh),
                      label: const Text("Next Quote"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}