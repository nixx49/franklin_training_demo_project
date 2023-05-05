import 'package:demo_project/splash_screen.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
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
              padding:
                  const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              width: 300,
              child: Image.asset('images/newlogo.png'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    child: TextFormField(
                      onChanged: (value){
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
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Your Password',
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  Container(
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  void loginButtonClick(){
    if(_usernameController.text == 'user124' && _passwordController.text == '12345')
    {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SplashScreen()));
    }else{
      print('LogIn Fail');
    }
  }




}

