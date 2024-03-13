import 'package:farm_ez/widgets/custom_clipper.dart';
import 'package:farm_ez/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  var _isLogin = true;
  var _enteredEmail = "";
  var _enteredPassword = "";
  var _isAuthenticating = false;

  late TextEditingController emailController;
  late TextEditingController passwordController;

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

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });
      if (_isLogin) {
        final userCredentials = await _firebase.signInWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
        if (userCredentials != false) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        }
      } else {
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);

        if (userCredentials != false) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        }
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {}
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? "Authentication failed."),
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    }
  }

  Widget _buildEmailTextField(
    TextEditingController controller,
    IconData icon,
    String hint,
  ) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.trim().isEmpty || !value.contains('@')) {
          return "Please enter a valid email address";
        }
      },
      onSaved: (value) {
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
    );
  }

  Widget _buildPasswordField(
    TextEditingController controller,
    IconData icon,
    String hint,
  ) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.trim().length < 6) {
          return "Password must be atleast 6 characters long";
        }
        return null;
      },
      onSaved: (value) {
        _enteredPassword = value!;
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
      obscureText: true,
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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 30, bottom: 20, right: 20, left: 20),
                width: 200,
                child: Image.asset('assets/logo/farmez_icon.png'),
              ),
              const SizedBox(
                height: 30,
              ),
              _isLogin
                  ? Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins-Bold",
                      ),
                    )
                  : Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins-Bold",
                      ),
                    ),
              const SizedBox(
                height: 40,
              ),
              _buildEmailTextField(emailController, Icons.mail, "Email ID"),
              _buildPasswordField(passwordController, Icons.key, "Password"),
              const SizedBox(
                height: 15,
              ),
              if (_isAuthenticating) const CircularProgressIndicator(),
              if (!_isAuthenticating)
                ElevatedButton(
                  onPressed: _submit,
                  // onPressed: _navigate,
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
    );
  }

  // Widget _buildSocialLogins() {
  //   return Column(
  //     children: [
  //       const Text(
  //         "Or sign in with",
  //         style: TextStyle(fontSize: 16),
  //       ),
  //       const SizedBox(height: 20),
  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 40.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             IconButton(
  //               onPressed: () {},
  //               icon: Image.asset("assets/login/google.png"),
  //               iconSize: 6,
  //             ),
  //             IconButton(
  //               onPressed: () {},
  //               icon: Image.asset("assets/login/facebook.png"),
  //               iconSize: 6,
  //             ),
  //             IconButton(
  //               onPressed: () {},
  //               icon: Image.asset("assets/login/twitter.png"),
  //               iconSize: 6,
  //             )
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.875,
              width: double.infinity,
              child: _buildInputFields(),
            ),
            // _buildSocialLogins(),
          ],
        ),
      ),
    );
  }
}
