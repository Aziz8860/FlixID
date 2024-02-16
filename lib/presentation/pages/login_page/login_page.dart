import 'package:flix_id/data/firebase/firebase_authentication.dart';
import 'package:flix_id/data/firebase/firebase_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/dummies/dummy_authentication.dart';
import '../../../data/dummies/dummy_user_repository.dart';
import '../../../domain/use_cases/login/login.dart';
import '../../providers/use_cases/login_provider.dart';
import '../main_page/main_page.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Login login = ref.watch(loginProvider);

              login(LoginParams(email: 'erik2@gmail.com', password: 'data123'))
                  .then((result) {
                if (result.isSuccess) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MainPage(user: result.resultValue!),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(result.errorMessage!),
                  ));
                }
              });
            },
            child: const Text('Login')),
      ),
    );
  }
}