import 'package:flutter/material.dart';
import 'package:lab12/elements_func.dart';
import 'package:lab12/services/request_catcher.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> with Elements{

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

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
                "Reset Password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Elements.spacer15,
              textField(text: "Email", validateEmail: true, controller: _emailController),
              Elements.spacer,
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                        final isValid = _formKey.currentState?.validate();
                        if (isValid == true){
                          RequestCatcherService().sendData({
                            'email': _emailController.text,
                          });
                        }
                      },
                      child: const Text(
                        "Reset",
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
