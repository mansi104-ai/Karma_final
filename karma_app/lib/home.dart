import 'package:flutter/material.dart';
import 'package:karma_app/todo_tile.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage>{

  // list of todo tasks
  List toDoList=[
    ['Make tutorial', false],
    ['Do Exercise', false],
  ];

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1]= !toDoList[index][1];
    });
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Colors.white ,
      appBar: AppBar(
        title: Text('TO DO'),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted:toDoList[index][1] ,
            onChanged: (value) => checkBoxChanged,
            );

        },
      ),
    );
  }
}