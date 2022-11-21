import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_ui/pages/main_page.dart';
import 'package:form_ui/pages/register_form_page.dart';

import '../translations/locale_keys.g.dart';

import '../model/user.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(7),
                  child: Text(
                    LocaleKeys.welcome.tr(),
                    style: const TextStyle(
                        fontSize: 35,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const LoginForm()
              ],
            )),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 270,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 8),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.mail),
                border: const OutlineInputBorder(),
                hintText: LocaleKeys.inputusername.tr(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 8),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.key),
                border: const OutlineInputBorder(),
                hintText: LocaleKeys.inputpassword.tr(),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomePage(),
                  ),
                );
              },
              child: Text(LocaleKeys.buttonSign.tr()),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(LocaleKeys.noAcc.tr()),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.deepPurple
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: Text(LocaleKeys.buttonSubmit.tr()))
              ],
            ),
          )
        ],
      ),
    );
  }
}