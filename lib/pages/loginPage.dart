import 'package:flutter/material.dart';
import 'package:sunstarmovers/Apis/auth_api.dart';
import 'package:sunstarmovers/pages/BottomNav.dart';
import 'package:sunstarmovers/pages/HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameCt = TextEditingController();
  TextEditingController passwordCt = TextEditingController();
  bool secureText=true;
  bool hasPasswordError = false;

  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(image: AssetImage("assets/login.png"))),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/logo.png")),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty)
                    {
                      return 'Required';
                    }
                  return null;
                },
                controller: userNameCt,
                obscureText: false,
                decoration: InputDecoration(
                    hintText: 'Username',
                    suffixIcon: Icon(
                      Icons.person_outline,
                      size: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.red)),
                    fillColor: Colors.blueAccent.withOpacity(0.1),
                    filled: true),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                validator: validatePassword,
                controller: passwordCt,
                obscureText: secureText,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: InkWell(
                    onTap: (){
                      setState(() {
                        secureText=!secureText;
                      });
                    },
                    child: Icon(secureText ? Icons.visibility : Icons.visibility_off),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  errorBorder: OutlineInputBorder( // Border for error state
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder( // Border for focused error state
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  fillColor: Colors.blueAccent.withOpacity(0.1),
                  filled: true,
                ),
              ),

              SizedBox(
                height: 25,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  )),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                width: 330,
                height: 60,
                child: ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate())
                      {
                        print('object');
                        var isSuccess=await AuthApi().login(userNameCt.text, passwordCt.text);
                        if(isSuccess)
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNav()),);
                        }
                      }
                  },

                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 17),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 5,
                      shadowColor: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  if (!hasMinimumLength(value, 8)) {
    return 'Password must be at least 8 characters long';
  }

  if (!hasUppercase(value)) {
    return 'Password must contain at least one uppercase letter';
  }

  if (!hasLowercase(value)) {
    return 'Password must contain at least one lowercase letter';
  }

  if (!hasDigit(value)) {
    return 'Password must contain at least one digit';
  }

  if (!hasSpecialCharacter(value)) {
    return 'Password must contain at least one special character';
  }

  return null; // Return null if validation passes
}

bool hasMinimumLength(String value, int length) {
  return value.length >= length;
}

bool hasUppercase(String value) {
  return RegExp(r'[A-Z]').hasMatch(value);
}

bool hasLowercase(String value) {
  return RegExp(r'[a-z]').hasMatch(value);
}

bool hasDigit(String value) {
  return RegExp(r'[0-9]').hasMatch(value);
}

bool hasSpecialCharacter(String value) {
  return RegExp(r'[!@#\$&*~]').hasMatch(value);
}
