import 'package:catatan_keuangan/pages/catatan_page.dart';
import 'package:catatan_keuangan/pages/create_transaction_page.dart';
import 'package:catatan_keuangan/pages/form_catatan_page.dart';
import 'package:catatan_keuangan/pages/starter_page.dart';
import 'package:catatan_keuangan/pages/home_page.dart';
import 'package:catatan_keuangan/providers/provider_transaksi.dart';
import 'package:catatan_keuangan/styles/colors_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TransaksiProvider(),
        ),
      ],
      child: MaterialApp(
        color: whiteColor,
        title: 'Contacts',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        // home: const StarterPage(),
        initialRoute: StarterPage.routeName,
        routes: {
          StarterPage.routeName: (context) => const StarterPage(),
          HomePage.routeName: (context) => const HomePage(),
          CreateTransaction.routeName: (context) => const CreateTransaction(),
          FormCatatan.routeName: (context) => const FormCatatan(),
          Catatanpage.routeName: (context) => const Catatanpage(),
        },
      ),
    );
  }
}
