
import 'package:flutter/material.dart';
import 'package:food_order/style.dart';

class ResetPassPage extends StatefulWidget {
  const ResetPassPage({super.key});

  @override
  State<ResetPassPage> createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  bool showPassword = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
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
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 45),
          child: Column(
            children: [
              Text('It looks like someone forgot their password.',
                  style: unbounded.copyWith(
                      fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              Center(
                child: Text(
                    'Don\'t worry all of us have done this before. Just give us your email and and we will take care the rest.',
                    textAlign: TextAlign.center,
                    style: unbounded.copyWith(
                        fontSize: 12, fontWeight: FontWeight.normal)),
              ),
              const SizedBox(height: 12),
              emailField(),
              const SizedBox(height: 15),
              Align(alignment: Alignment.centerRight, child: loginButton()),
            ],
          )),
    );
  }

  Widget emailField() {
    return TextField(
      controller: username,
      style: lexend.copyWith(color: white),
      keyboardType: TextInputType.name,
      decoration: loginTheme.copyWith(
          labelText: 'Your Email please :D',
          labelStyle: lexend.copyWith(color: Colors.black38)),
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
        'Goo!',
        style: lexend,
      ),
    );
  }
}
