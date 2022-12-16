import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class _SingInState extends State<SingIn> {
  late TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _emailController = _emailController;
    _passwordController = _passwordController;
    super.initState();
  }

  @override
  void dispose() {
    _emailController = _emailController;
    _passwordController = _passwordController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 247, 246, 246),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Sing in",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 100,
                child: Image.asset(
                    'http://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png'),
              ),
              CustomEntryField(
                hint: 'Enter email',
                controller: _emailController,
                isPassword: false,
              ),
              CustomEntryField(
                hint: 'Enter password',
                controller: _passwordController,
                isPassword: true,
              ),
              Center(
                child: CustomFlatButton(
                  label: "Submit",
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: (() {}),
                child: Center(
                  child: Text('Sign up',
                      style: GoogleFonts.mulish(
                        color: Colors.blue,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      )),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (() {}),
                child: Center(
                  child: Text(
                    'Forget password?',
                    style: GoogleFonts.mulish(
                      color: Colors.blue,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}
