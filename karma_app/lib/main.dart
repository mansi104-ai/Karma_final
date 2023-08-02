import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'home.dart'
// main.dart
import 'amplifyconfiguration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      safePrint('Successfully configured');
    } on Exception catch (e) {
      safePrint('Error configuring Amplify: $e');
    }
  }

  final String userName = "USER_NAME"; // Replace with the user's name
  final String avatarImageURL =
      "https://example.com/avatar.jpg"; // Replace with the actual URL

  final List<String> dates = List.generate(11, (index) {
    DateTime date = DateTime.now().add(Duration(days: index));
    return "${date.day}/${date.month}";
  });

  List<String> todos = []; // Initialize todos as an empty list
  // Function to navigate to the HomeScreen

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        builder: Authenticator.builder(),
       
        home: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Navigation Bar
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            color: Colors.blue,
            child: Row(
              children: [
                // Welcome Text
                Text(
                  "WELCOME",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Spacer to push the Avatar to the right
                Spacer(),
                // User Name
                Text(
                  userName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                // Avatar
                CircleAvatar(
                  radius: 32.0,
                  backgroundImage: NetworkImage(avatarImageURL), // Load image from URL
                ),
              ],
            ),
          ),
          // Add other widgets for the main content of the home screen below
          // ...
          Expanded(
            child: ListView.builder(
              itemCount: dates.length,
              itemBuilder: (context, index) {
                final date = dates[index];
                return ListTile(
                  title: Text(date),
                  onTap: () {
                    _showTodoModal(context, date);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTodoModal(context, "Add New Todo");
        },
        child: Icon(Icons.add),
      ),
          ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
        ),
      );
  }


void _showTodoModal(BuildContext context, String selectedDate) {
    final _todoController = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Todo List for $selectedDate",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _todoController,
                decoration: InputDecoration(
                  hintText: "Type your todo...",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_todoController.text.isNotEmpty) {
                    // Add the todo to the list
                    setState(() {
                      todos.add(_todoController.text);
                    });

                    // Clear the text field after adding the todo
                    _todoController.clear();
                  }
                },
                child: Text("Add Todo"),
              ),
              SizedBox(height: 16.0),
              // Display todos below the button
              if (todos.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: todos.map((todo) => Text(todo)).toList(),
                ),
            ],
          ),
        );
      },
    );
  }
}