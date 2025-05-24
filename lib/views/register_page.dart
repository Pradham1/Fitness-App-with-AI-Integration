import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                const Text('Register',
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
                    print('Register pressed');
                  }, 
                  child: const Text('Register'),
                  ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    print('Goes to login page');
                  }, 
                  child: 
                    const Text('Already Registered? Login here'),
                ),


                

              ],  
            )
          )
        ));
  }
}