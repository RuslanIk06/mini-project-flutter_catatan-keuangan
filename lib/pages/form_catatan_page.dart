import 'package:catatan_keuangan/pages/catatan_page.dart';
import 'package:catatan_keuangan/components/styles/colors_style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormCatatan extends StatefulWidget {
  static const routeName = "/form_catatan";
  const FormCatatan({super.key});

  @override
  State<FormCatatan> createState() => _FormCatatanState();
}

class _FormCatatanState extends State<FormCatatan> {
  final formKey = GlobalKey<FormState>();
  final _noteController = TextEditingController();

  late SharedPreferences dataNote;
  late bool newNote;

  void checkNote() async {
    dataNote = await SharedPreferences.getInstance();
    newNote = dataNote.getBool('note') ?? true;

    if (newNote == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Catatanpage(),
          ),
          (route) => false);
    }
  }

  @override
  void initState() {
    checkNote();
    super.initState();
  }

  @override
  void dispose() {
    _noteController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Catatan"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.note_add_sharp),
                  label: Text('Catatan'),
                  hintText: 'Masukan Catatan',
                ),
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return 'Masukan Catatan Dengan Benar';
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                maxLines: 5,
                textInputAction: TextInputAction.next,
                controller: _noteController,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final isValidForm = formKey.currentState!.validate();
                  final note = _noteController.text;

                  dataNote.setBool('login', false);
                  dataNote.setString('note', note);
                  if (isValidForm) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Catatanpage(),
                        ),
                        (route) => false);
                  }
                },
                child: const Text('Tambah'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: redColor,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
