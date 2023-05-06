import 'package:demo_project/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'welcome ${widget.username}',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInPage()));
            },child: const Text('LogOut'),
          )
        ],
      ),
    );
  }
}
