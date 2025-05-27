import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/firebase_options.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
      backgroundColor: Color.fromARGB(255, 240, 240, 220),
      body:  FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Center(
                  child: Container(
                      width: 300,
                      height: 400,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: emailController,
                            autocorrect: false,
                            decoration: InputDecoration(
                                suffixIcon: const Icon(Icons.email),
                                labelText: 'Email',
                                hintText: 'Enter your email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      width: 5),
                                )),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.lock),
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    width: 5),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              final email = emailController.text;
                              final password = passwordController.text;
                              try{
                                await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: email, 
                                  password: password,
                                );
                                Navigator.pushNamed(context, '/home');              
                              } on FirebaseAuthException catch(e) {
                                if (e.code == 'user-not-found') {
                                  print('No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                  print('Wrong password provided for that user.');
                                } else {
                                  print(e.code);
                                }
                              }
                            },
                            child: const Text('Login'),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: const Text('Not Registered yet? Click here'),
                          ),
                        ],
                      )),
                );
              default:
                return const Text('loading');
            }
          },
        )
      ); 
  }
}
      