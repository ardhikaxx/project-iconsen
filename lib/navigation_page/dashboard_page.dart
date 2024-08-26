import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:project_iconsen/component/button_component.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isCheckInDisabled = false;
  bool isCheckOutDisabled = true;

  void _showMessageDialog(BuildContext context, String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      //* anda custom title sesuai keinginan anda
      title: 'Selamat anda',
      titleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.grey,
      ),
      desc: message,
      descTextStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: const Color(0xFF0493AE),
      ),
    ).show();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }

  void _handleCheckIn() {
    setState(() {
      isCheckInDisabled = true;
      isCheckOutDisabled = false;
    });
    //* anda custom pesan sesuai keinginan anda
    _showMessageDialog(context, 'Berhasil Check-in');
  }

  void _handleCheckOut() {
    setState(() {
      isCheckInDisabled = false;
      isCheckOutDisabled = true;
    });
    //* anda custom pesan sesuai keinginan anda
    _showMessageDialog(context, 'Berhasil Check-out');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/image/iconsen.png",
              height: 30,
            ),
            Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Selamat Datang,",
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 2,
                  color: Colors.grey,
                ),
              ),
              Text(
                "User!",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 25),
              ButtonComponent(
                  onTap: isCheckInDisabled ? null : _handleCheckIn,
                  nameBtn: "CHECK IN"),
              const SizedBox(height: 12),
              ButtonComponent(
                  onTap: isCheckOutDisabled ? null : _handleCheckOut,
                  nameBtn: "CHECK OUT"),
            ],
          ),
        ),
      )),
    );
  }
}
