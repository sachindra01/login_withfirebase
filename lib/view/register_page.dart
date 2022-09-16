import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_page/constant/custom_back_button.dart';
import 'package:login_page/constant/custom_textfield.dart';
import 'package:login_page/constant/style.dart';
import 'package:login_page/controller/auth_controller.dart';
import 'package:login_page/view/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _numberController =TextEditingController();
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passController =TextEditingController();
  final AuthController _con =Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
  //  var height = MediaQuery.of(context).size.height;
   var  width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff252323),
      appBar: AppBar(
        backgroundColor: const Color(0xff252323),
        elevation: 0.0,
        leading: CustomBackButton(
          buttonColor: const Color(0xff252323),
            onTap: (){
            Get.back();
          }
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
             ),
             const Padding(
               padding: EdgeInsets.all(12.0),
               child: Text('sign up with one of the following options.',style: TextStyle(
                color: Color(0xffAEACAC),
                fontSize: 17
               ),),
             ),
             const SizedBox(
              height: 30,
             ),
             Row(
              children: [
                CustomBackButton(
                  icon: Image.asset('assets/images/google.png'),
                  height: 64,
                  width: 174,
                  buttonColor: const Color(0xff252323),
                    onTap: (){
                  }
                ),
                CustomBackButton(
                   icon: Image.asset('assets/images/apple.png'),
                  height: 64,
                  width: 174,
                  buttonColor: const Color(0xff252323),
                    onTap: (){
                  }
                ),
                
              ],
             ),
             const Padding(
               padding: EdgeInsets.all(12.0),
               child: Text('Number',style: TextStyle(
                color: Color(0xffAEACAC),
                fontSize: 17
               ),),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: CustomTextField(
                  context: context,
                  controller:_numberController,
                    inputTextStyle: const TextStyle(
                    color: Colors.white
                  ),
                ),
             ),
             const Padding(
               padding: EdgeInsets.all(12.0),
               child: Text('Email',style: TextStyle(
                color: Color(0xffAEACAC),
                fontSize: 17
               ),),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: CustomTextField(
                  context: context,
                  controller:_emailController,
                    inputTextStyle: const TextStyle(
                    color: Colors.white
                  ),
                ),
             ),
              const Padding(
               padding: EdgeInsets.all(12.0),
               child: Text('Password',style: TextStyle(
                color: Color(0xffAEACAC),
                fontSize: 17
               ),),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: CustomTextField(
                  context: context,
                  controller:_passController,
                  inputTextStyle: const TextStyle(
                    color: Colors.white
                  ),
                ),
             ),
             const SizedBox(
              height: 10,
             ),
            GetBuilder(
              init: AuthController(),
              builder: (context) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomBackButton(
                      icon:_con.isloginLoading.value?const CircularProgressIndicator():
                       const Center(child: Text('Create Account',style: TextStyle(
                        color: white,
                      ),)),
                      height: 64,
                      width: width,
                      buttonColor: const Color(0xff252323),
                        onTap: ()async{
                      _con.register(_emailController.text.trim(),
                      _passController.text.trim(),_numberController.text.trim());
                      }
                    ),
                  ),
                );
              }
            ),
             Padding(
               padding: const EdgeInsets.all(12.0),
               child: Center(
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children:  [
                      const Text('Already have an account?',style: TextStyle(
                      color: Color(0xffAEACAC),
                      fontSize: 17
                     ),
                     ),
                      InkWell(
                        onTap: (){
                          Get.to(()=>const LoginPage());
                        },
                        child: const Text('Log in',style:TextStyle(
                        color: white,
                        fontSize: 17),),
                      ),
                   ],
                 ),
               ),
             ),

          ],
        ),
      ),
    );
  }
}