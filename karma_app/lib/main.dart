import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'home.dart'; // Import the home.dart file
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

  // Function to navigate to the HomeScreen

  void _goToHomeScreen() {
  Navigator.pushNamed(context, '/home');
}

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        builder: Authenticator.builder(),
        routes: {
        '/': (context) => MyApp(), // The default route (home)
        '/home': (context) => Home(username: 'Gopal Verma'), // Named route for Home widget
      },
        home: Scaffold(
          appBar: AppBar(
            title: Text('Main Screen'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('You are logged in!'),
                SizedBox(height: 20),
                ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/home'), // Navigate to /home named route
                child: Text('Go to HomeScreen'),
              )
              ]
                ),
            
            ),
          ),
        ),
      );
  }
}