import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hk_policestation_hq/controllers/Controllers.dart';

import '../API.dart';
import '../style.dart';
import '../widgets/text_field_prefix_icon.dart';
import '../widgets/toast.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //const LoginScreen({super.key});
  bool _isLoading = false;
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Image.asset(
              'assets/img_health_kangaroo_logo.png',
              height: 120,
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 280,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    //height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 0.2,
                                blurRadius: 20,
                              )
                            ],
                          ),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            children: [
                              TextfieldPrefixIcon(
                                controller: _emailPhoneController,
                                hintText: 'Email',
                                icon: Icons.person,
                              ),
                              const Divider(
                                color: Colors.black45,
                                height: 40,
                                indent: 10,
                                endIndent: 10,
                              ),
                              TextfieldPrefixIcon(
                                controller: _passwordController,
                                hintText: 'Password',
                                icon: Icons.key,
                                boolonTap: true,
                                obscureText: true,
                              ),
                              const SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isLoading = false;
                      });

                      if (_emailPhoneController.text.isEmpty ||
                          _passwordController.text.isEmpty) {
                        showToast(
                            color: Colors.red, msg: "Fields cannot be empty");
                      } else {
                        setState(() {
                          _isLoading = true;
                        });
                        Api()
                            .login(
                                username: _emailPhoneController.text,
                                pass: _passwordController.text)
                            .whenComplete(() => null)
                            .then((value) {
                          print(value);

                          if (value["success"] == "0") {
                            showToast(color: Colors.red, msg: value["message"]);
                          }
                          if (value["success"] == "1") {
                            if (value["message"] == "login successfully") {
                              box.write('userData', value);

                              Controllers().userPutData.id =
                                  value['details']['id'];
                              Controllers().userPutData.name =
                                  value['details']['name'];
                              Controllers().userPutData.email =
                                  value['details']['email'];
                              Controllers().userPutData.password =
                                  value['details']['password'];
                              Controllers().userPutData.phone =
                                  value['details']['phone'];
                              Controllers().userPutData.address =
                                  value['details']['address'];
                              Controllers().userPutData.image =
                                  value['details']['image'];
                              Controllers().userPutData.device_type =
                                  value['details']['device_type'];
                              Controllers().userPutData.login_type =
                                  value['details']['login_type'];
                              Controllers().userPutData.latitude =
                                  value['details']['latitude'];
                              Controllers().userPutData.longitude =
                                  value['details']['longitude'];
                              Controllers().userPutData.reg_id =
                                  value['details']['reg_id'];
                              Controllers().userPutData.EmailOtp =
                                  value['details']['EmailOtp'];
                              Controllers().userPutData.created =
                                  value['details']['created'];
                              Controllers().userPutData.updated =
                                  value['details']['updated'];
const CircularProgressIndicator();
                              Get.to(const HomeScreen());
                            
                            }
                          }
                        });
                      }

                      // LoginUser(_emailController.text,
                      //     passwordController.text, regIdController.text);
                    },
                    child: SizedBox(
                      width: 200,
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: ShapeDecoration(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          color: Styles().themeGreen,
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator()
                            : Text('Login',
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    color: Color(0xfff5f5f5),
                                    fontSize: 16,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  // _forgotPassword();
                },
                child: const Text('Forgot Password ?')),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                // Get.to(RegisterScreen());

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const RegisterScreen(),
                //     ));
                // _emailController.clear();
                // _passwordController.clear();
                // showPass = true;
              },
              child: Text(
                'Register',
                style: TextStyle(
                    color: Styles().themeGreen,
                    decoration: TextDecoration.underline),
              ),
            ),
            // Opacity(
            //   opacity: 0.001,
            //   child: TextField(
            //       enabled: false,
            //       controller: _regIdController,
            //       obscureText: showPass,
            //       style: const TextStyle(fontSize: 20),
            //       decoration: InputDecoration(
            //         floatingLabelBehavior: FloatingLabelBehavior.never,
            //         hintStyle: const TextStyle(fontSize: 16),
            //         hintText: 'Password',
            //         suffixIcon: InkWell(

            //           child: const Icon(
            //             Icons.remove_red_eye,
            //             color: Colors.black,
            //           ),
            //         ),
            //         prefixIcon: Icon(
            //           Icons.key,
            //           color: Styles.greenColor,
            //           size: 35,
            //         ),
            //         border: InputBorder.none,
            //       )),
            // ),
          ],
        ),
      ),
    );
  }
}
