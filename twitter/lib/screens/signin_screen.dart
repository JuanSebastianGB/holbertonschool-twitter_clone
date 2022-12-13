import 'package:flutter/cupertino.dart';

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
    return Container();
  }
}

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}
