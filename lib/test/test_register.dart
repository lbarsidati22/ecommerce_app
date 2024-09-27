import 'package:ecommerce_app/test/test_login.dart';
import 'package:ecommerce_app/test/test_shared/test_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestRegister extends StatefulWidget {
  const TestRegister({super.key});

  @override
  State<TestRegister> createState() => _TestRegisterState();
}

bool testisPassword8char = false;
bool isLoading = false;
bool isShowPassword = true;
final testemailController = TextEditingController();
final testpasswordController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _TestRegisterState extends State<TestRegister> {
  register() async {
    setState(() {
      isLoading = true;
    });
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: testemailController.text,
        password: testpasswordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        testshowSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        testshowSnackBar(context, 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      testshowSnackBar(context, e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  testonPasswordchanged(String password) {
    testisPassword8char = false;
    setState(() {
      if (password.contains(RegExp(r'.{8,}'))) {
        testisPassword8char = true;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    testemailController.dispose();
    testpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 43, 43),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: textfailedDecoratins.copyWith(
                      hintText: 'enter your username',
                      suffixIcon: Icon(
                        Icons.person,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    validator: (email) {
                      return email!.contains(RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
                          ? null
                          : 'enter a valid email';
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: testemailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: textfailedDecoratins.copyWith(
                      hintText: 'enter your email',
                      suffixIcon: Icon(
                        Icons.email,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    onChanged: (password) {
                      testonPasswordchanged(password);
                    },
                    validator: (value) {
                      return value!.length < 8
                          ? 'Enter a last 8 charckter'
                          : null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: testpasswordController,
                    keyboardType: TextInputType.text,
                    obscureText: isShowPassword,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: textfailedDecoratins.copyWith(
                      hintText: 'enter your password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                        icon: isShowPassword
                            ? Icon(
                                Icons.visibility,
                              )
                            : Icon(Icons.visibility_off),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          size: 17,
                        ),
                        decoration: BoxDecoration(
                          color:
                              testisPassword8char ? Colors.green : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text('At lest 8 chrackyer'),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          size: 17,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text('has Special Characters'),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          size: 17,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text('has Lowercase'),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          size: 17,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text('has Digits'),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.check,
                          size: 17,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 11,
                      ),
                      Text('has Uppercase'),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      backgroundColor: const WidgetStatePropertyAll(
                        Colors.green,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          register();
                        });
                      }
                    },
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text('Sign up'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account ?',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TestLogin(),
                            ),
                          );
                        },
                        child: Text('Sign in'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const textfailedDecoratins = InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
);
