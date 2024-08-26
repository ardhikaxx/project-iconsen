import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:project_iconsen/component/button_component.dart';
import 'package:project_iconsen/component/button_navigation.dart';
import 'package:project_iconsen/component/password_field_component.dart';
import 'package:project_iconsen/component/textfield_component.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailSignInController = TextEditingController();
  final passwordSignInController = TextEditingController();

  void _showMessageDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      //* anda custom title sesuai keinginan anda
      title: 'Welcome',
      desc: "Selamat Datang Kembali, User",
      descTextStyle: TextStyle(
        fontSize: 16,
      ),
    ).show();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const ButtonNavigation()),
        (Route<dynamic> route) => false,
      );
    });
  }

  //* jika anda ingin menambahkan pesan error bisa di pakai fungsi di bawah ini
  //* anda bisa menambahkan nya di beberapa kondisi pada file lain, tinggal disalin fungsi ini

  void _showErrorMessageDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      //* anda custom title sesuai keinginan anda
      title: 'Maaf',
      desc: "Username atau Password salah, silahkan cek kembali",
      descTextStyle: TextStyle(
        fontSize: 16,
      ),
    ).show();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/iconsen.png",
                height: 50,
                scale: 0.7,
              ),
              const SizedBox(height: 30),
              TextfieldComponent(
                controller: emailSignInController,
                labelText: "Email",
                isEmailField: true,
              ),
              const SizedBox(height: 15),
              PasswordFieldComponent(
                controller: passwordSignInController,
                labelText: "Password",
              ),
              const SizedBox(height: 20),
              ButtonComponent(
                onTap: () {
                  _showMessageDialog(context);
                },
                nameBtn: "LOGIN",
              )
            ],
          ),
        ),
      )),
    ));
  }
}
