import 'package:flutter/material.dart';
import 'package:partiu_app/Utils/Colors.dart';
import 'package:partiu_app/Widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: Container(), flex: 2,),

            Image.asset('images/aiai.png', color: primaryColor, height: 64,),
            
            const SizedBox(height: 64,),

            TextFieldInput(
              textEditingController: _emailController, 
              hintText: "Digite seu Email", 
              textInputType: TextInputType.emailAddress),

            const SizedBox(height: 64,),

            TextFieldInput(
              textEditingController: _passwordController, 
              hintText: "Digite sua senha", 
              textInputType: TextInputType.visiblePassword,
              isPassword: true)
          ],
        ),
      ))
      
    );
  }
}