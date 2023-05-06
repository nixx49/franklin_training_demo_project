import 'package:demo_project/home_page.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: const Text(
                'LogIn',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 20, right: 20),
              width: 200,
              child: Image.asset('images/newlogo.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    child: TextFormField(
                      onChanged: (value) {
                        print(value);
                      },
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Your User Name',
                        hintText: 'Username',
                      ),
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      onChanged: (value) {
                        print(value);
                      },
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Your Password',
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: SizedBox(
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: loginButtonClick,
                        child: const Text(
                          'LogIn',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void loginButtonClick() {
    if (_usernameController.text == 'user123' &&
        _passwordController.text == '12345') {
      print('LogIn Success');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    username: _usernameController.text,
                  )));
    } else {
      print('LogIn Fail');
      showAlertDialog(context);
    }
  }

  void showAlertDialog(context) {
    Widget okButton = ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('OK'));
    AlertDialog alertDialog = AlertDialog(
      title: const Text('Error'),
      content: const Text('Password or username invalid'),
      actions: [okButton],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
