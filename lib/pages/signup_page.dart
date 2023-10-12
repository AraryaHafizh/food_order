
import 'package:flutter/material.dart';
import 'package:food_order/style.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPassword = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi There!',
                style: unbounded.copyWith(
                    fontSize: 30, fontWeight: FontWeight.bold)),
            Text('Welcome to MyApp',
                style: unbounded.copyWith(
                    fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      Wrap(
                        runSpacing: 15,
                        children: [
                          txtField('What\'s your name?', username),
                          txtField('Your Number Pls', number),
                          txtField('and Your Email', email),
                          passwordField(),
                          Align(
                              alignment: Alignment.centerRight,
                              child: loginButton()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget txtField(label, controller) {
    return TextField(
      controller: controller,
      style: lexend.copyWith(color: white),
      keyboardType: TextInputType.name,
      decoration: loginTheme.copyWith(
          labelText: label, labelStyle: lexend.copyWith(color: Colors.black38)),
    );
  }

  Widget passwordField() {
    return TextFormField(
      controller: password,
      obscureText: showPassword,
      style: lexend.copyWith(color: white),
      decoration: loginTheme.copyWith(
          labelText: 'Laast, Password!',
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
        // userInputCheck();
        // debugPrint('test');
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
        'Sign ME Up!',
        style: lexend,
      ),
    );
  }
}
