import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_keyhash/flutter_facebook_keyhash.dart';
import 'package:get/get.dart';
import 'package:login_page/constant/custom_back_button.dart';
import 'package:login_page/constant/custom_textfield.dart';
import 'package:login_page/constant/style.dart';
import 'package:login_page/controller/auth_controller.dart';
import 'package:login_page/view/register_page.dart';
// import com.facebook.FacebookSdk;
// import com.facebook.appevents.AppEventsLogger;


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passController =TextEditingController();
  final AuthController _con =Get.put(AuthController());

  @override
  void initState() {
    printKeyHash();
    super.initState();
  }

  void printKeyHash() async{

   String? key=await FlutterFacebookKeyhash.getFaceBookKeyHash ??
          'Unknown platform version';
   if (kDebugMode) {
     print(key);
   }

  }
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
                  icon: Image.asset('assets/images/google.png',color: Colors.red,),
                  height: 64,
                  width: 174,
                  buttonColor: const Color(0xff252323),
                    onTap: ()async{
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ));
                       _con.signInWithGoogle();
                  }
                ),
                CustomBackButton(
                   icon: Image.asset('assets/images/facebook.png',height: 20,),
                  height: 64,
                  width: 174,
                  buttonColor: const Color(0xff252323),
                    onTap: (){
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ));
                      _con.logInWithFacebook();
                  }
                ),
                
              ],
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
              builder: (_) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomBackButton(
                      icon:
                       const Center(child: Text('Log In',style: TextStyle(
                        color: white,
                        fontSize: 18
                      ),)),
                      height: 64,
                      width: width,
                      buttonColor: const Color(0xff252323),
                        onTap: (){
                          showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ));
                      _con.login(_emailController.text.trim(),
                      _passController.text.trim());
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
                      const Text('New to account?',style: TextStyle(
                      color: Color(0xffAEACAC),
                      fontSize: 17
                     ),
                     ),
                      InkWell(
                        onTap: (){
                          Get.to(()=>const RegisterPage());
                        },
                        child: const Text('Register',style: TextStyle(
                        color: white,
                        fontSize: 17
                                           ),
                                           ),
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