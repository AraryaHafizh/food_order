
import 'package:flutter/material.dart';
import 'package:food_order/pages/home_page.dart';
import 'package:food_order/pages/reset_password.dart';
import 'package:food_order/pages/signup_page.dart';
import 'package:food_order/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> isValid = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome Back \nFella!',
              style:
                  unbounded.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 60),
            usernameField(),
            const SizedBox(height: 25),
            passwordField(),
            const SizedBox(height: 25),
            options(),
            Align(alignment: Alignment.centerRight, child: loginButton()),
          ],
        ),
      ),
    );
  }

  Widget usernameField() {
    return Form(
      key: isValid,
      child: TextFormField(
        controller: username,
        style: lexend.copyWith(color: white),
        keyboardType: TextInputType.name,
        decoration: loginTheme.copyWith(
          labelText: 'Username',
          labelStyle: lexend.copyWith(color: Colors.black38),
        ),
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      controller: password,
      obscureText: showPassword,
      style: lexend.copyWith(color: white),
      decoration: loginTheme.copyWith(
          labelText: 'Password',
          labelStyle: lexend.copyWith(color: Colors.black38),
          suffixIcon: IconButton(
              icon: Icon(
                showPassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.black54,
              ),
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              })),
    );
  }

  Widget loginButton() {
    return ElevatedButton(
      onPressed: () {
        inputCheck();
      },
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 22, vertical: 12)),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.amber; //<-- SEE HERE
              }
              return null; // Defer to the widget's default.
            },
          )),
      child: Text(
        'Log In',
        style: lexend,
      ),
    );
  }

  Widget options() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => ResetPassPage()));
            debugPrint('tertekan');
          },
          child: Text('Forged Password?',
              style: lexend.copyWith(fontSize: 11, color: Colors.black54)),
        ),
        Text(
          'Or',
          style: lexend.copyWith(fontSize: 11, color: Colors.black54),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => SignUpPage()));
              debugPrint('tertekan');
            },
            child: Text(
              'Don\'t Have Account?',
              style: lexend.copyWith(fontSize: 11, color: Colors.black54),
            )),
      ],
    );
  }

  inputCheck() {
    bool isAllowed = false;
    if (username.text.isNotEmpty) {
      isAllowed = true;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (builder) => HomePage(name: username.text)));
    }
    if (!isAllowed) {
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: Text('Error'),
                content: Text('Pastikan username tidak kosong.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'OK',
                    ),
                  )
                ],
              )));
    }
  }
}
