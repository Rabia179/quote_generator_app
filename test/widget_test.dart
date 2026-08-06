import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quote_generator_app/main.dart';

void main() {
  testWidgets('Quote App Smoke Test', (WidgetTester tester) async {
    await tester.pumpWidget(const QuoteApp());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Random Quote Generator'), findsOneWidget);
  });
}