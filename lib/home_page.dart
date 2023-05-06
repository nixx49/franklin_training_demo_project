import 'package:demo_project/rest_api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final apiService = RestAPIService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiService.getUsers();
    //this is the main thread
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        child: Column(
          children: [
            // Expanded(child: FutureBuilder(
            //   future: ,
            // )),
          ],
        ),

      ),
    );
  }
}
