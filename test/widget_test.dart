import 'package:ai_demo_auto/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows auth flow from splash to phone login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const App());

    expect(find.text('Đẹp theo cách bạn muốn'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 1300));

    expect(find.text('Bắt đầu trải nghiệm cùng Đông Á'), findsOneWidget);
    expect(find.text('TIẾP TỤC'), findsOneWidget);
  });
}
