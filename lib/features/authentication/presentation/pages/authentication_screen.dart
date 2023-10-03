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

  late AuthenticateUserUseCase _authenticateUserUseCase;

  @override
  void initState() {
    // TODO Remove hardcoded
    emailController.text = "rick@morty.com";
    passwordController.text = "123456789";

    _authenticateUserUseCase = serviceLocator<AuthenticateUserUseCase>();
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset("assets/images/rick_and_morty_auth.jpg"),
                const SizedBox(height: 20),
                const Text(
                  'Authentication',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Pickle Rick is the only one who can crack your\n password. So don’t worry, and enter your credentials.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    suffixIcon: IconButton(
                      onPressed: () {
                        emailController.text = '';
                      },
                      icon: const Icon(Icons.cancel_outlined),
                    ),
                    helperText: "It's the key to your portal gun!",
                    border: const OutlineInputBorder(),
                    labelText: 'Email Address',
                    hintText: 'Enter your Email Address',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  maxLines: 1,
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.edit),
                      suffixIcon: IconButton(
                        onPressed: () {
                          passwordController.text = '';
                        },
                        icon: const Icon(Icons.cancel_outlined),
                      ),
                      border: const OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your secure password',
                      helperText:
                          'Your password must be at least 9 dimensions long!'),
                ),
                const SizedBox(height: 15),
                FilledButton(
                  child: const Text('Authenticate'),
                  onPressed: () async {
                    final result = await _authenticateUserUseCase(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Signed in as : ${result.email.toString()}')));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardScreen(),
                        ),
                      );
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Note: If no account exists, one will be created for you',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
