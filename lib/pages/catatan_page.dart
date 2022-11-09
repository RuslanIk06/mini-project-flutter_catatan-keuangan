import 'package:catatan_keuangan/pages/form_catatan_page.dart';
import 'package:catatan_keuangan/pages/home_page.dart';
import 'package:catatan_keuangan/styles/colors_style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Catatanpage extends StatefulWidget {
  static const routeName = "/catatan";
  const Catatanpage({super.key});

  @override
  State<Catatanpage> createState() => _CatatanpageState();
}

class _CatatanpageState extends State<Catatanpage> {
  late SharedPreferences dataNote;
  String note = "";

  void initial() async {
    dataNote = await SharedPreferences.getInstance();
    setState(() {
      note = dataNote.getString("note") ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    initial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catatan"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(note),
              ElevatedButton.icon(
                onPressed: () {
                  dataNote.setBool("note", true);
                  dataNote.remove("note");
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                      (route) => false);
                },
                icon: const Icon(Icons.logout),
                label: const Text("Hapus"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: redColor,
                  foregroundColor: Colors.white,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.home_filled),
                label: const Text("Go To Home"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: redColor,
                  foregroundColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
