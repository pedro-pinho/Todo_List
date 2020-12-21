import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/src/controllers/home_controller.dart';
import 'package:todo_list/src/models/todo_model.dart';
import 'package:todo_list/src/repositories/todo_repository.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

main() {
  final repository = TodoRepositoryMock();
  final controller = HomeController(repository);

  test('Fill variable todo', () async {
    when(repository.fetchAll()).thenAnswer((_) async => [TodoModel()]);

    await controller.start();
    expect(controller.todos.isNotEmpty, true);
  });
}
