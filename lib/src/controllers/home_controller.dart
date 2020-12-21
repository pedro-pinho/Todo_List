import 'package:todo_list/src/models/todo_model.dart';
import 'package:todo_list/src/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final TodoRepository _repository;
  HomeState state = HomeState.start;

  HomeController([TodoRepository repository])
      : _repository = repository ?? TodoRepository();

  Future start() async {
    this.state = HomeState.loading;
    try {
      todos = await _repository.fetchAll();
      this.state = HomeState.success;
    } catch (e) {
      this.state = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
