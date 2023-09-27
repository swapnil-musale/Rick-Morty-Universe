import 'package:flutter/material.dart';
import 'package:rick_morty_universe/features/authentication/domain/use_cases/authenticate_user_use_case.dart';
import 'package:rick_morty_universe/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:rick_morty_universe/features/injection_container.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late AuthenticateUserUseCase authenticateUserUseCase;

  @override
  void initState() {
    // TODO Remove hardcoded
    emailController.text = "rick@morty.com";
    passwordController.text = "123456789";

    authenticateUserUseCase = serviceLocator<AuthenticateUserUseCase>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter your Email Address',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your secure password',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('Authenticate'),
                onPressed: () async {
                  final result = await authenticateUserUseCase.call(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('Signed in as : ${result.email.toString()}')));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
