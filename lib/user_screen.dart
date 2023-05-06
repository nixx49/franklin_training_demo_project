import 'package:demo_project/user.dart';
import 'package:flutter/material.dart';
class UserScreen extends StatefulWidget {
  final User user;
  const UserScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              //margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: ClipOval(
                  child: Image.network(widget.user.image, fit: BoxFit.cover, width: 150,height: 150,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
