import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traffic_police/blocs/authentication/auth_temp.dart';
// import 'package:traffic_police/blocs/login/login.dart';
import 'package:traffic_police/main.dart';

class InputField extends StatefulWidget {
  //static final <FormState> keyLogin =  GlobalKey();

  @override
  State<InputField> createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  // variables
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? email;
  String? password;

  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    // toggle obscureText

    // clears input text
    void clearInput() {
      _emailController.clear();
    }

    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          // Email input

          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: colorCustom1,
              ),
            )),
            child: TextFormField(
              controller: _emailController,
              onChanged: (value) => email = value.trim(),
              keyboardType: TextInputType.emailAddress,
              validator: (value) => !isEmail(value.toString())
                  ? "please provide a valid email address"
                  : null,
              decoration: InputDecoration(
                hintText: "Enter your email",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                suffix: IconButton(
                  onPressed: () => clearInput(),
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),

          // password input

          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: colorCustom1,
                ),
              ),
            ),
            child: TextFormField(
              controller: _passwordController,
              onChanged: (value) => password = value.trim(),
              validator: (value) => value != null && value.length < 8
                  ? "Password must be 8 or more characters in length"
                  : null,
              onSaved: (value) => password = value.toString(),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      _isHidden = !_isHidden;
                    });
                  },
                  icon:
                      Icon(_isHidden ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              obscureText: _isHidden,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 40.0,
            child: BlocConsumer<AuthtempBloc, AuthtempState>(
              listener: (context, state) {},
              builder: (context, state) {
                Widget buttonChild = Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                );
                if (state is AuthLoading) {
                  buttonChild = SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }

                return ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      formKey.currentState?.save();

                      BlocProvider.of<AuthtempBloc>(context).add(
                        LoginEvent(
                            email: email ?? "", password: password ?? ""),
                      );
                    }
                  },
                  child: buttonChild,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  bool isEmail(String value) {
    String regex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(regex);

    return value.isNotEmpty && regExp.hasMatch(value);
  }
}


                // if (formKey.currentState?.validate() ?? false) {
                //   formKey.currentState?.save();
                //   //Navigator.pushReplacementNamed(context, RouteGenerator.officerHome);
                // }