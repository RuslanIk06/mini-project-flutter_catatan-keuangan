import 'package:catatan_keuangan/pages/home_page.dart';
import 'package:catatan_keuangan/components/styles/colors_style.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StarterPage extends StatelessWidget {
  static const routeName = '/';
  const StarterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 475,
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(225)),
              color: greenColor,
            ),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Lottie.asset("assets/lottie.json"),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Making your life easier",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: blackColor),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Manage your income and expense in easiest \nway with this app",
                  style: TextStyle(
                      fontSize: 12,
                      color: blackColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 75),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return const HomePage();
                            },
                            transitionsBuilder: ((context, animation,
                                secondaryAnimation, child) {
                              final tween =
                                  Tween(begin: Offset(0, 1), end: Offset.zero);
                              return RotationTransition(
                                turns: CurvedAnimation(
                                    parent: animation, curve: Curves.linear),
                                child: child,
                              );
                            }),
                          ),
                        );
                      },
                      child: Text(
                        "          Get Started          ",
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      style:
                          ElevatedButton.styleFrom(backgroundColor: greenColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
