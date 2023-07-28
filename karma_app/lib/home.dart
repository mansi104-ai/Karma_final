import 'package:flutter/material.dart';

void main() => runApp(ProductivityApp());

class ProductivityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String userName = "Gopal Verma"; // Replace with the user's name
  final String avatarImageURL =
      "https://example.com/avatar.jpg"; // Replace with the actual URL

  final List<String> dates = List.generate(11, (index) {
    DateTime date = DateTime.now().add(Duration(days: index));
    return "${date.day}/${date.month}";
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    fontSize: 20.0,
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
                    fontSize: 18.0,
                  ),
                ),
                // Avatar
                CircleAvatar(
                  radius: 24.0,
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
                return ListTile(
                  title: Text(dates[index]),
                  onTap: () {
                    // Handle date selection if needed
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTodoModal();
        },
        child: Icon(Icons.add),
      ),
    );
  }
        
  
         

  void _showTodoModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Todos List",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              // Add your todo list here, e.g., using ListView or other widgets
              Text("Todo 1"),
              Text("Todo 2"),
              // Add other todo items here...
            ],
          ),
        );
      },
    );
  }
}
  


