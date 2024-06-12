import 'package:flutter/material.dart';
import 'package:todo_app/app/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.start();
  }
  
  _success(){
    return ListView.builder(
        itemCount: controller.todos.length,
        itemBuilder: (context, index) {
          var todo = controller.todos[index];
          return ListTile(
            leading: Checkbox(
              value: todo.completed,
              onChanged: (value) {
                controller.todos[index].completed = value;
              },
            ),
            title: Text(todo.title!)
          );
        },
      );
  }

  _error(){
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start();
        },
        child: const Text('Retry'),
      ),
    );
  }

  loading(){
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  start(){
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return start();
      case HomeState.loading:
        return loading();
      case HomeState.success:
        return _success();
      case HomeState.error:
        return _error();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Todo\'s'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controller.start();
            },
          ),
        ],
      ),
      body: AnimatedBuilder(animation: controller.state, builder: (context, child) {
        return stateManagement(controller.state.value);
      }
      ),
    );
  }
}