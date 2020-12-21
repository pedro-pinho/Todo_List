import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/src/repositories/todo_repository.dart';

main() {
  final repository = TodoRepository();
  test('Bring list of TodoModel', () async {
    final list = await repository.fetchAll();
    expect(list[0].title, 'delectus aut autem');
  });
}
