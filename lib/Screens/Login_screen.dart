import 'package:flutter/material.dart';
import 'package:partiu_app/Utils/Colors.dart';
import 'package:partiu_app/Utils/utils.dart';
import 'package:partiu_app/Widgets/text_field_input.dart';
import 'package:partiu_app/resources/auth_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(email: _emailController.text, password: _passwordController.text);

    if(res == "sucesso"){

    } else {
      
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
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

            Image.asset('assets/images/logo.png', height: 200,),
            
            const SizedBox(height: 64,),

            TextFieldInput(
              textEditingController: _emailController, 
              hintText: "Digite seu Email", 
              textInputType: TextInputType.emailAddress),

            const SizedBox(height: 24,),

            TextFieldInput(
              textEditingController: _passwordController, 
              hintText: "Digite sua senha", 
              textInputType: TextInputType.visiblePassword,
              isPassword: true,),

            const SizedBox(height: 24,),

            InkWell(
              onTap: loginUser,
              child: Container(
                child: _isLoading ? const Center(child: CircularProgressIndicator(),) : const Text("Log in"),
                width: double.infinity,
                alignment:Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),color: blueColor),
              ),
            ),
            const SizedBox(height: 12,),
            Flexible(child: Container(), flex: 2,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text("Ainda não possui conta?"),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container (
                    child: const Text("Cadastre-se", style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ))
      
    );
  }
}