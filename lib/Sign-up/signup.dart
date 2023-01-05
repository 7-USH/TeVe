import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:teve/Home/home.dart';
import 'package:teve/Login/models/session_model.dart';
import 'package:teve/Sign-up/models/register_model.dart';
import 'package:teve/Sign-up/service/signup_service.dart';
import 'package:teve/Utils/teve_theme.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  SignUpService service = SignUpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: TeveTheme.whiteColor,
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                  colors: [TeveTheme.darkBlue, TeveTheme.slightBlue])),
        ),
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                  colors: [TeveTheme.darkBlue, TeveTheme.slightBlue])),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign Up",
                    style: TeveTheme.appText(size: 35, weight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Create an account so you can watch your favorite show's",
                    style: TeveTheme.appText(size: 17, weight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          style: TeveTheme.appText(
                              size: 14, weight: FontWeight.normal),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter name";
                            } else if (value.length < 8) {
                              return "Name should be atleast 8 characters long";
                            }
                            return null;
                          },
                          decoration: TeveTheme.waInputDecoration(
                            hint: "Name",
                            fontSize: 15,
                            prefixIcon: Icons.mail,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: emailController,
                          style: TeveTheme.appText(
                              size: 14, weight: FontWeight.normal),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter email";
                            } else if (!RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value)) {
                              return "Email is not valid";
                            }
                            return null;
                          },
                          decoration: TeveTheme.waInputDecoration(
                            hint: "Email",
                            fontSize: 15,
                            prefixIcon: Icons.mail,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: passwordController,
                          style: TeveTheme.appText(
                              size: 14, weight: FontWeight.normal),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter password";
                            }
                            return null;
                          },
                          decoration: TeveTheme.waInputDecoration(
                            hint: "Password",
                            fontSize: 15,
                            prefixIcon: Icons.lock,
                          ),
                        ),
                        Text(
                          "Your password must be 8 or more characters long & contain a mix of upper & lower case letter, numbers & symbols.",
                          style: TeveTheme.appText(
                              size: 11, weight: FontWeight.w400),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 55,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  end: Alignment.topRight,
                                  begin: Alignment.bottomLeft,
                                  stops: const [0.0, 1.0],
                                  tileMode: TileMode.clamp,
                                  colors: [
                                    TeveTheme.logoDarkColor,
                                    TeveTheme.logoLightColor.withOpacity(0.7)
                                  ]),
                              borderRadius: BorderRadius.circular(30)),
                          child: ElevatedButton(
                              style: TeveTheme.buttonStyle(
                                  backColor: Colors.transparent,
                                  borderColor: Colors.transparent),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  service
                                      .registerUser(
                                          model: RegisterModel(
                                              email: emailController.text,
                                              password: passwordController.text,
                                              name: nameController.text),
                                          context: context)
                                      .then((value) {
                                    if (value is SessionModel) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return const Home();
                                      }));
                                    } else {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  });
                                }
                              },
                              child: _isLoading
                                  ? Center(
                                      child: LoadingAnimationWidget
                                          .staggeredDotsWave(
                                      color: Colors.white,
                                      size: 20,
                                    ))
                                  : Text(
                                      "Create an account",
                                      style: TeveTheme.appText(
                                          size: 16,
                                          weight: FontWeight.w600,
                                          color: TeveTheme.whiteColor),
                                    )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "By signing/creating an account, you agree to our \nTerms of Use and Privacy Policy",
                                style: TeveTheme.appText(
                                    size: 11.5,
                                    weight: FontWeight.w500,
                                    color: TeveTheme.whiteColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
