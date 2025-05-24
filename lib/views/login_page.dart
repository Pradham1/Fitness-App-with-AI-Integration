import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 220),
      body: 
        Center(
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
                const Text('Login',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.email),
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0), width: 5),
                    )
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.lock),
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: const Color.fromARGB(255, 0, 0, 0), width: 5),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print('Login pressed');
                  }, 
                  child: const Text('Login'),
                  ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    print('Goes to register page');
                  }, 
                  child: 
                    const Text('Not registered yet? Click here'),
                ),


                

              ],  
            )
          )
        ));
  }
}