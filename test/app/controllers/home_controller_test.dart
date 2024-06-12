import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/app/controllers/home_controller.dart';
import 'package:todo_app/app/models/todo_model.dart';
import 'package:todo_app/app/repositories/todo_repository.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}
void main() {
  final repository = TodoRepositoryMock();
  final controller = HomeController(repository);
  
  test('Deve preencher variavel todos', () async{
    when(repository.fetchTodos()).thenAnswer((_) async => [TodoModel(),]);

    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.success);
    expect(controller.todos.isNotEmpty, true);
  });
  test('Deve modificar o estado para erro se a requisição falhar', () async{
    when(repository.fetchTodos()).thenThrow(Exception());

    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.error);
  });
}