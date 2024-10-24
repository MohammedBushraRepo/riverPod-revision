import 'package:flutter/material.dart';
import 'package:riverpod_revision/second_screen.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
            },
            child: Text('Second Screen'),
          ),
        ),
      ),
    );
  }
}
