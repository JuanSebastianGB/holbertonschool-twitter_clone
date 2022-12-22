import 'package:flutter/material.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();
  late TextEditingController _confirmController = TextEditingController();
  late GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController = _nameController;
    _emailController = _emailController;
    _passwordController = _passwordController;
    _confirmController = _confirmController;
    _formKey = _formKey;
    super.initState();
  }

  @override
  void dispose() {
    _nameController = _nameController;
    _emailController = _emailController;
    _passwordController = _passwordController;
    _confirmController = _confirmController;
    _formKey = _formKey;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 247, 246, 246),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: BackButton(
          color: Colors.blue,
          onPressed: (() {
            Navigator.of(context).pop();
          }),
        ),
        title: const Text("Sign up", style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 100,
              child: Image.asset('assets/images/twit.png'),
            ),
            CustomEntryField(
              hint: 'Enter name',
              controller: _nameController,
              isPassword: false,
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
            CustomEntryField(
              hint: 'Confirm password',
              controller: _confirmController,
              isPassword: true,
            ),
            Center(
              child: CustomFlatButton(
                label: 'Submit',
                onPressed: signUpUser,
              ),
            )
          ],
        ),
      ),
    );
  }

  void signUpUser() async {
    String textError = '';
    final signUp = await Auth().attemptSignUp(
        email: _emailController.text.trim(),
        name: _nameController.text.trim(),
        password: _passwordController.text.trim(),
        passwordConfirmation: _confirmController.text.trim());
    switch (signUp) {
      case Errors.none:
        textError = 'Account Created!';
        break;
      case Errors.weakError:
        textError = 'The password provided is too weak.';
        break;
      case Errors.matchError:
        textError = 'Passwords doesn’t match.';
        break;
      case Errors.existsError:
        textError = 'An account already exists with that email.';
        break;
      case Errors.error:
        textError = 'Failed to Login! Please try later.';
        break;
      default:
        textError = 'Unknown error';
    }
    final snackBar = SnackBar(
      content: Text(textError),
      backgroundColor: signUp == Errors.none ? Colors.green : Colors.red,
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
    );
    if (mounted) ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
