import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogInPage'),
        leading: const Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  blurRadius: 2.0,
                  spreadRadius: 3.0)
            ]),
        width: 200,
        height: 200,
        child: Image.asset('images/newlogo.png'),
      ),
    );
  }
}
