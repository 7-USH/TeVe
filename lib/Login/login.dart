// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:teve/Home/home.dart';
import 'package:teve/Login/models/login_model.dart';
import 'package:teve/Login/models/session_model.dart';
import 'package:teve/Login/service/login_service.dart';
import 'package:teve/Sign-up/signup.dart';
import 'package:teve/Utils/teve_theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  LoginService service = LoginService();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    const orientations = [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ];
    SystemChrome.setPreferredOrientations(orientations);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                    colors: [TeveTheme.darkBlue, TeveTheme.slightBlue])),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: const [0.0, 1.0],
                                tileMode: TileMode.clamp,
                                colors: [
                                  TeveTheme.logoDarkColor,
                                  TeveTheme.logoLightColor.withOpacity(0.6)
                                ]),
                            borderRadius: BorderRadius.circular(25)),
                        child: const Center(
                          child: Icon(
                            Icons.live_tv_rounded,
                            color: TeveTheme.darkBlue,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "TeVe",
                        style: TeveTheme.appText(
                            size: 40, weight: FontWeight.w600, isShadow: true),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sign In to continue",
                    style: TeveTheme.appText(
                        size: 21, weight: FontWeight.w500, isShadow: true),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            style: TeveTheme.appText(
                                size: 14, weight: FontWeight.normal),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter email";
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
                                        .loginUser(
                                            model: LoginModel(
                                                username: emailController.text,
                                                password:
                                                    passwordController.text),
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
                                        "Sign In",
                                        style: TeveTheme.appText(
                                            size: 16,
                                            weight: FontWeight.w600,
                                            color: TeveTheme.whiteColor),
                                      )),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have any account? ",
                    style: TeveTheme.appText(
                        size: 12, weight: FontWeight.w500, isShadow: true),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return const SignUp();
                      }));
                    },
                    child: Text(
                      " Register",
                      style: TeveTheme.appText(
                          size: 12,
                          weight: FontWeight.w500,
                          isShadow: true,
                          color: TeveTheme.logoDarkColor),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
