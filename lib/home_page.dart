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
                child: ListView.separated(
                  //physics: const ClampingScrollPhysics(),
              itemCount: 20,
              separatorBuilder: (context, index) {
                return Container(
                  color: Colors.grey,
                  height: 1,
                );
              },
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      'Test 1234',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInPage()));
                    },
                    child: const Text('LogOut'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
