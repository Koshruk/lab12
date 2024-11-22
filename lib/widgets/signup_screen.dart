import 'package:flutter/material.dart';
import 'package:lab12/elements_func.dart';
import 'package:lab12/services/request_catcher.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}


class _SignupScreenState extends State<SignupScreen> with Elements {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200.0,
                child: Image.asset('assets/images/flutter-logo.png'),
              ),
              Elements.spacer,
              const Text(
                "Sign up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Elements.spacer15,
              textField(text: "Login:", controller: _loginController),
              Elements.spacer15,
              textField(text: "Email:", validateEmail: true, controller: _emailController),
              Elements.spacer15,
              textField(text: "Password:", validatePassword: true, controller: _passwordController),
              Elements.spacer,
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final isValid = _formKey.currentState?.validate();
                        if (isValid == true) {
                          RequestCatcherService().sendData({
                            'login': _loginController.text,
                            'email': _emailController.text,
                            'password': _passwordController.text,
                          });
                        }
                      },
                      child: const Text(
                        "Sign up",
                      ),
                    ),
                  ),
                ],
              ),
              Elements.spacer,
              Row(
                children: <Widget>[
                  Expanded(
                      child: backButton(context)
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}