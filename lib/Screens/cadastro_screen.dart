import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partiu_app/Responsive/layout_screen.dart';
import 'package:partiu_app/Responsive/mobile_screen_layout.dart';
import 'package:partiu_app/Responsive/web_screen_layout.dart';
import 'package:partiu_app/Screens/Login_screen.dart';
import 'package:partiu_app/Utils/Colors.dart';
import 'package:partiu_app/Utils/utils.dart';
import 'package:partiu_app/Widgets/text_field_input.dart';
import 'package:partiu_app/resources/auth_methods.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({Key? key}) : super(key: key);

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  // Uint8List? _image; variavel necessaria para imagem

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _idadeController.dispose();
    _passwordController.dispose();
  }

  // void selectImage() async{
  //   Uint8List image =  await pickImage(ImageSource.gallery);
  //   setState(() {
  //     _image = image;
  //   });
  // }
  // função para recuperar a imagem

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        username: _usernameController.text,
        idade: _idadeController.text,
        password: _passwordController.text);

    setState(() {
      _isLoading = false;
    });
    if (res != 'successo') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const ResponsiveLayout(
          mobileScreenLayout: MobileScreenLayout(),
          webScreenLayout: WebScreenLayout(),
        ),
      ));
    }
  }

  void navigateToLogin() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(),
            flex: 2,
          ),
          Image.asset(
            'assets/images/logo.png',
            height: 200,
          ),
          const SizedBox(
            height: 64,
          ),
          TextFieldInput(
              textEditingController: _emailController,
              hintText: "Digite seu Email",
              textInputType: TextInputType.emailAddress),
          const SizedBox(
            height: 24,
          ),
          TextFieldInput(
              textEditingController: _usernameController,
              hintText: "Digite seu nome inteiro",
              textInputType: TextInputType.text),
          const SizedBox(
            height: 24,
          ),
          TextFieldInput(
              textEditingController: _idadeController,
              hintText: "Digite sua data de nascimento",
              textInputType: TextInputType.text),
          const SizedBox(
            height: 24,
          ),
          TextFieldInput(
            textEditingController: _passwordController,
            hintText: "Digite sua senha",
            textInputType: TextInputType.visiblePassword,
            isPassword: true,
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: signUpUser,
            child: Container(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : const Text("Cadastre-se"),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  color: blueColor),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Flexible(
            child: Container(),
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Text("Já possui conta?"),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
              ),
              GestureDetector(
                onTap: navigateToLogin,
                child: Container(
                  child: const Text(
                    "Entrar",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    )));
  }
}
