import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> _todos = [];
  final TextEditingController _controller = TextEditingController();

  void _addTodo() {
    setState(() {
      _todos.add(_controller.text);
      _controller.clear();
    });
  }

  void _removeTodoAtIndex(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  Widget _buildTodoItem(String todo, int index) {
    return Dismissible(
      key: Key(todo),
      onDismissed: (direction) {
        setState(() {
          _todos.removeAt(index);
        });
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.0),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: Card(
        elevation: 3.0,
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: ListTile(
          title: Text(
            todo,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _removeTodoAtIndex(index),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 5.0,
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: 'Enter a task',
                        ),
                      ),
                      SizedBox(height: 10),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: _addTodo,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return _buildTodoItem(_todos[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
