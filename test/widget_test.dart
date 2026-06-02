import 'package:flutter_test/flutter_test.dart';
import 'package:salluexez_portfolio/main.dart';

void main() {
  testWidgets('portfolio renders core sections', (tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pump();

    expect(find.text('MOHD'), findsOneWidget);
    expect(find.text('SALAUDDIN'), findsOneWidget);
    expect(find.text('CURRENT STATUS'), findsOneWidget);
    expect(find.text('WORK'), findsWidgets);
    expect(find.text('CONTACT'), findsWidgets);
  });
}
