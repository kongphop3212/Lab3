import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab3_shopping_cart/main.dart';

void main() {
  testWidgets('Shopping Cart increments and decrements test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the initial total price is 0.
    expect(find.text('ราคารวม: 0 บาท'), findsOneWidget);

    // Tap the '+' icon for iPad and trigger a frame.
    await tester.tap(find.widgetWithText(IconButton, 'add').first);
    await tester.pump();

    // Verify that the total price has incremented.
    expect(find.text('ราคารวม: 19,000 บาท'), findsOneWidget);

    // Tap the '-' icon for iPad and trigger a frame.
    await tester.tap(find.widgetWithText(IconButton, 'remove').first);
    await tester.pump();

    // Verify that the total price has decremented back to 0.
    expect(find.text('ราคารวม: 0 บาท'), findsOneWidget);

    // Test clear button
    await tester.tap(find.text('Clear'));
    await tester.pump();

    // Verify that the total price is still 0 after clearing the cart.
    expect(find.text('ราคารวม: 0 บาท'), findsOneWidget);
  });
}