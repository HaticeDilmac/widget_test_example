import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_example/main.dart';

void main() {
  testWidgets('Add and remove a todo', (tester) async {
    //Widgetıbuild ederiz
    await tester.pumpWidget(const TodoList());

    //test girilecek yere konulacak değeri gir.
    //enterText ile textField içine girilecek değer girilir.
    await tester.enterText(find.byType(TextField), 'Hello World');

    //widget tipine göre tıklama işi yapılır.
    await tester.tap(find.byType(FloatingActionButton));

    //widget yenile
    await tester.pump();

    //ilk ifadede girilen text var mı
    expect(find.text('Hello World'), findsOneWidget);

    //sürükleme için dismissible tipinde widget var mmı
    await tester.drag(find.byType(Dismissible), const Offset(500, 0));

    //uygulamanın pumpını sonlandırıyor
    await tester.pumpAndSettle();

    //Ögenin ekranda olmadığı teyit edilsin.
    expect(find.text('Hello World'), findsNothing);
  });
}
