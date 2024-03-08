import 'package:farm_ez/screens/home_screen.dart';
import 'package:farm_ez/screens/home_screen.dart';
import 'package:farm_ez/widgets/custom_clipper.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';

// final _firebase = FirebaseAuth.instance;

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() {
//     return _AuthScreenState();
//   }
// }
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final _formKey = GlobalKey<FormState>();

  var _isLogin = true;
  var _enteredEmail = "";
  var _enteredPassword = "";
  var _isAuthenticating = false;
  var _enteredUsername = "";

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid || !_isLogin) {
      return;
    }

    _formKey.currentState!.save();

    // try {
    //   setState(() {
    //     _isAuthenticating = true;
    //   });
    //   if (_isLogin) {
    //     final userCredentials = await _firebase.signInWithEmailAndPassword(
    //         email: _enteredEmail, password: _enteredPassword);
    //   } else {
    //     final userCredentials = await _firebase.createUserWithEmailAndPassword(
    //         email: _enteredEmail, password: _enteredPassword);

    //     final storageRef = FirebaseStorage.instance
    //         .ref()
    //         .child('user_images')
    //         .child('${userCredentials.user!.uid}.jpg');

    //     await storageRef.putFile(_selectedImage!);
    //     final imageUrl = await storageRef.getDownloadURL();

    //     await FirebaseFirestore.instance
    //         .collection('users')
    //         .doc(userCredentials.user!.uid)
    //         .set({
    //       'username': 'to be done///',
    //       'username': _enteredUsername,
    //       'email': _enteredEmail,
    //       'image_url': imageUrl,
    //     });
    //   }
    // } on FirebaseAuthException catch (error) {
    //   if (error.code == 'email-already-in-use') {}
    //   ScaffoldMessenger.of(context).clearSnackBars();
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(error.message ?? "Authentication failed."),
    //     ),
    //   );
    //   setState(() {
    //     _isAuthenticating = false;
    //   });
    // }
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  void _navigate() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const HomeScreen(),
      ),
    );
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.7,
              width: double.infinity,
              child: _buildInputFields(),
            ),
            // _buildSocialLogins(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputFields() {
    return ClipPath(
        clipper: CustomClipperWidget(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 79, 200, 83),
                Colors.greenAccent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 60),
              if (_isLogin)
                const Text(
                  "Sign in",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                  ),
                ),
              if (!_isLogin)
                const Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                  ),
                ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTextField(
                          emailController, Icons.person_outline, "Email",
                          isPassword: false),
                      // if (!_isLogin)
                      //   TextFormField(
                      //       decoration:
                      //           const InputDecoration(labelText: "Username"),
                      //       enableSuggestions: false,
                      //       validator: (value) {
                      //         if (value == null ||
                      //             value.isEmpty ||
                      //             value.trim().length < 4) {
                      //           return "Please enter atleast 4 characters.";
                      //         }
                      //         return null;
                      //       },
                      //       onSaved: (value) {
                      //         _enteredUsername = value!;
                      //       }),
                      _buildTextField(
                          passwordController, Icons.info_outline, "Password",
                          isPassword: true),
                      const SizedBox(
                        height: 15,
                      ),
                      if (_isAuthenticating) const CircularProgressIndicator(),
                      if (!_isAuthenticating)
                        ElevatedButton(
                          // onPressed: _submit,
                          onPressed: _navigate,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                          child: Text(_isLogin ? "Login" : "Sign Up"),
                        ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(_isLogin
                            ? "Create an account"
                            : "I already have an account"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildSocialLogins() {
    return Column(
      children: [
        const Text(
          "Or sign in with",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/login/google.png"),
                iconSize: 6,
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/login/facebook.png"),
                iconSize: 6,
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset("assets/login/twitter.png"),
                iconSize: 6,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
      TextEditingController controller, IconData icon, String hint,
      {bool isPassword = false}) {
    return TextFormField(
      validator: (value) {
        if (!isPassword && value == null ||
            value!.trim().isEmpty ||
            !value.contains('@')) {
          return "Please enter a valid email address";
        }
        if (isPassword && value == null || value.trim().length < 6) {
          return "Password must be atleast 6 characters long";
        }
      },
      onSaved: (value) {
        if (isPassword)
          _enteredPassword = value!;
        else
          _enteredEmail = value!;
      },
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
      obscureText: isPassword,
    );
  }
}
