import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_monitoring_app/providers/auth_provider.dart';
import 'package:health_monitoring_app/screens/modal_tosignup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    print("Login Page Disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    String? logInStatus = "initial";

    final email = TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter email';
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return 'Please enter a valid email';
        }
        if (logInStatus == "user-not-found") {
          return 'No user found for that email';
        }
        return null;
      },
      controller: emailController,
      decoration: const InputDecoration(
        hintText: "Email",
      ),
    );

    final password = TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter password';
        }
        if (value.length < 6) {
          return 'Password should have more than 6 characters';
        }
        if (logInStatus == "wrong-password") {
          return 'Wrong password';
        }
        return null;
      },
      controller: passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
    );

    final form = Form(
      key: _formKey,
      child: Column(children: [
        email,
        password,
      ]),
    );

    final loginButton = Padding(
      key: const Key('loginButton'),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () async {
          logInStatus = await context.read<AuthProvider>().signIn(
                emailController.text.trim(),
                passwordController.text.trim(),
              );
          if (logInStatus != "success") _formKey.currentState!.validate();
        },
        child: const Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final signUpButton = Padding(
      key: const Key('signUpButton'),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ModalToSignUp(),
            ),
          );
        },
        child: const Text('Sign Up', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          children: <Widget>[
            const Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            form,
            loginButton,
            signUpButton,
          ],
        ),
      ),
    );
  }
}
