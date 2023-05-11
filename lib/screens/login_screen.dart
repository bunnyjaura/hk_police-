import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../API.dart';
import '../style.dart';
import '../widgets/text_field_prefix_icon.dart';
import '../widgets/toast.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //const LoginScreen({super.key});
  bool _isLoading = false;
  TextEditingController _emailPhoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
            Container(
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
                        Api().login(username: _emailPhoneController.text, pass:  _passwordController.text).whenComplete(() => null).then((value) {
                            
                            
                            Get.to(HomeScreen());
                        });
                      
                          Apis()
                              .vendorDoctorLogin(
                                  email: _emailPhoneController.text,
                                  password: _passwordController.text)
                              .whenComplete(() => null)
                              .then((value) async {
                            if (value["message"] == "login successfully") {
                              userModal.qualificationTitle =
                                  value["details"]['qualificationTitle'];
                              userModal.specialistTitle =
                                  value["details"]['specialistTitle'];
                              userModal.id = value["details"]['id'];
                              userModal.dr_qualification =
                                  value["details"]['dr_qualification'];
                              userModal.dr_speciality =
                                  value["details"]['dr_speciality'];
                              userModal.name = value["details"]['name'];
                              userModal.email = value["details"]['email'];
                              userModal.phone = value["details"]['phone'];
                              userModal.password =
                                  value["details"]['password'];
                              userModal.address = value["details"]['address'];
                              userModal.gender = value["details"]['gender'];
                              userModal.clinic_Name =
                                  value["details"]['clinic_Name'];
                              userModal.councilNumber =
                                  value["details"]['councilNumber'];
                              userModal.licenceNumber =
                                  value["details"]['licenceNumber'];
                              userModal.doctorImage =
                                  value["details"]['doctorImage'];
                              userModal.signature =
                                  value["details"]['signature'];
                              userModal.councilCertificate =
                                  value["details"]['councilCertificate'];
                              userModal.licence = value["details"]['licence'];
                              userModal.photoId = value["details"]['photoId'];
                              userModal.workExp = value["details"]['workExp'];
                              userModal.language =
                                  value["details"]['language'];
                              userModal.online_price =
                                  value["details"]['online_price'];
                              userModal.online_status =
                                  value["details"]['online_status'];
                              userModal.offline_price =
                                  value["details"]['offline_price'];
                              userModal.offline_status =
                                  value["details"]['offline_status'];
                              userModal.wallet = value["details"]['wallet'];
                              userModal.status = value["details"]['status'];
                              userModal.balance_amount =
                                  value["details"]['balance_amount'];
                              userModal.reg_id = value["details"]['reg_id'];
                              userModal.device_type =
                                  value["details"]['device_type'];
                              userModal.deviceID =
                                  value["details"]['deviceID'];
                              userModal.login_type =
                                  value["details"]['login_type'];
                              userModal.latitude =
                                  value["details"]['latitude'];
                              userModal.longitude =
                                  value["details"]['longitude'];
                              userModal.chatID = value["details"]['chatID'];
                              userModal.qualification =
                                  value["details"]['qualification'];
                              userModal.council_num =
                                  value["details"]['council_num'];
                              userModal.doctorSignature =
                                  value["details"]['doctorSignature'];
                              userModal.created = value["details"]['created'];
                              userModal.updated = value["details"]['updated'];
                              userModal.certificateFiles =
                                  value["details"]['certificateFiles'];
                              userModal.qualificationFiles =
                                  value["details"]['qualificationFiles'];

                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setBool('isLoggedIn', true);
                              prefs.setString('userDetails',
                                  jsonEncode(value['details']).toString());
                              // prefs.setString('id', data['details']['id']);
                              //  prefs.setString('id', data['details']['id']);
                              setState(() {
                                _isLoading = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    duration: Duration(milliseconds: 1000),
                                    backgroundColor:
                                        Color.fromARGB(255, 53, 53, 53),
                                    content: Text(
                                      'Processing Data',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              );
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => HomeScreen(),
                              //     ));
                            } else {
                              showToast(color: Colors.red, msg: value["message"].toString())

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
