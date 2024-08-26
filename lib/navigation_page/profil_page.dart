import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:project_iconsen/component/button_component.dart';
import 'package:project_iconsen/component/textfield_component.dart';
import 'package:project_iconsen/login_page.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final originSchoolController = TextEditingController();
  final statusController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameController.text = 'UserKB23';
    nameController.text = 'John Dowes Deker';
    originSchoolController.text = 'Universitas ABC';
    statusController.text = 'Magang';
  }

  void _showMessageDialog(BuildContext context) {
    AwesomeDialog(
            context: context,
            dialogType: DialogType.question,
            animType: AnimType.topSlide,
            //* anda custom title sesuai keinginan anda
            title: 'Keluar',
            desc: "Apakah anda ingin keluar dari akun ini ?",
            descTextStyle: TextStyle(
              fontSize: 16,
            ),
            btnOkOnPress: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ));
            },
            btnOkText: "Ok",
            reverseBtnOrder: true,
            btnCancelOnPress: () {},
            btnCancelText: "Cancel")
        .show();
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
              "Profil",
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
                Image.asset(
                  "assets/image/profil_icon.png",
                  width: 110,
                  height: 110,
                ),
                const SizedBox(height: 10),
                TextfieldComponent(
                  controller: usernameController,
                  labelText: "Username",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                TextfieldComponent(
                  controller: nameController,
                  labelText: "Nama",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                TextfieldComponent(
                  controller: originSchoolController,
                  labelText: "Asal Sekolah/Universitas",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                TextfieldComponent(
                  controller: statusController,
                  labelText: "Status",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                ButtonComponent(onTap: () {}, nameBtn: "Update"),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    _showMessageDialog(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500,
                            blurRadius: 4,
                            offset: Offset(0, 0.5),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            size: 30,
                            color: Colors.red,
                          ),
                          SizedBox(width: 6),
                          Text(
                            "Sign Out",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
