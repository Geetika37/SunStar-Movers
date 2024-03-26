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
                validator: (value){
                  if(value!.isEmpty)
                  {
                    return 'Required';
                  }
                  return null;
                },
                controller: passwordCt,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: Icon(
                      Icons.lock_outline,
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
