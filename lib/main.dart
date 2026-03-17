import 'package:flutter/material.dart';

import 'models/todo.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF7AAACE)),
        useMaterial3: true,
        ),
      home: TodoScreen()
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Todo> _todos=[];
  final _controller=TextEditingController();

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  void _addTodo(){
    final text=_controller.text.trim();
    if(text.isEmpty)return;

    setState(() {
      _todos.add(Todo(id: DateTime.now().toString(), title: text));
      _controller.clear();
    });
  }

  void _toggleTodo(String id) {
    setState(() {
      final todo = _todos.firstWhere((t) => t.id == id);
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodo(String id){
    setState(() {
      _todos.removeWhere((t)=>t.id==id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Todos'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Add a new task...'
                    ),
                  onSubmitted: (_)=>_addTodo(),
                ),
              ),
              SizedBox(width: 10,),
              FilledButton(onPressed: (){
                _addTodo();
              }, child: Text('Add'))
            ],
          ),
          SizedBox(height: 10,),
          Expanded(child: _todos.isEmpty
              ? Text('No todos yet')
              :ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context,index){
                final todo=_todos[index];
                return ListTile(
                  leading: Checkbox(value: todo.isDone, onChanged: (_)=>_toggleTodo(todo.id)),
                  title: Text(todo.title),
                  trailing: IconButton(onPressed: ()=>_deleteTodo(todo.id), icon: Icon(Icons.delete_outline)),
                );
              })
          )
        ],
      ),

    );
  }
}
