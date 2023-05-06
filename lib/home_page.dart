import 'package:demo_project/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
7877
class _HomePageState extends State<HomePage> {
  List<String> data = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
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
            Expanded(
                child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 1),
                    ],
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.access_alarm,
                      color: Colors.orange,
                    ),
                    title: Text(
                      data[index],
                      style: const TextStyle(color: Colors.black),
                    ),
                    subtitle: const Text(
                      'Days',
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  ),
                );

                // return Container(
                //   margin: const EdgeInsets.symmetric(vertical: 10),
                //   height: 50,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.blue,
                //   ),
                //   child: Center(
                //     child: Text(
                //       data[index],
                //       style: const TextStyle(color: Colors.white),
                //     ),
                //   ),
                // );
              },
            )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LogInPage()));
                },
                child: const Text('LogOut'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
