import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:silah_app/core/presentation/ui/widget/cards/lawyer_summary_card.dart';

void main() {
  testWidgets('Lawyer summary card renders profile details', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LawyerSummaryCard(
            name: 'Raghad Al-Darbi',
            specialization: 'Family Law',
            experienceLabel: '10 years',
          ),
        ),
      ),
    );

    expect(find.text('Raghad Al-Darbi'), findsOneWidget);
    expect(find.text('Family Law'), findsOneWidget);
    expect(find.text('10 years'), findsOneWidget);
  });
}
