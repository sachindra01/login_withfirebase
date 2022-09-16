import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_page/constant/toast_message.dart';

import 'package:login_page/view/home_screen.dart';

import 'package:login_page/view/login_page.dart';

import '../constant/constant.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
   late RxBool isloginLoading = false.obs;
  late Rx<User?> firebaseUser;
  dynamic email;
  dynamic number;
  dynamic allData;
  // bool registerpage =true;
  
  
  late Rx<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance. 
    // Since we have to use that many times I just made a constant file and declared there
    
    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);
      
      
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    
    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    if (user == null ||user.refreshToken==null) {
        
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => const LoginPage());
        
    } 
      else{

      Get.offAll(() => const HomeScreen());
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    if (kDebugMode) {
      print(googleSignInAccount);
    }
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => const LoginPage());
    } else  {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => const HomeScreen());
    }
  }

  signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // ignore: avoid_print, invalid_return_type_for_catch_error
        await auth.signInWithCredential(credential).catchError((onErr) => print(onErr));
      }
    }on FirebaseAuthException catch  (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

   register(String email, String password,String number) async {
    try {
      isloginLoading(true);
        UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        User? user = result.user;
        await FirebaseFirestore.instance.collection('users').doc(user!.email).set({ 'email': email,"password":password,"phoneNumber":number}).then((value) {
           showToastMessage('Singn Up sucessfully');
          //  registerpage=true;
          //  Get.to(()=>const LoginPage());
           });


         
    }on FirebaseAuthException catch  (e){
      showToastMessage(e.code);
      if (kDebugMode) {
      }
      
    }finally{
        isloginLoading(false);

    }
  }
  

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password).then((value) => {
        showToastMessage('Logged In sucessfully')
      });
    } on FirebaseAuthException catch  (e) {
      showToastMessage(e.code);
    }
  }

  void signOut() async {
    await auth.signOut();
  }


void logInWithFacebook() async{
    try{
      final facebookLogin = await FacebookAuth.instance.login(
        permissions: [
          'email'
          'public_profile'
        ]
      );
      final userData = await FacebookAuth.instance.getUserData();

      final facebookAuthCredential = FacebookAuthProvider.credential(facebookLogin.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      await FirebaseFirestore.instance.collection("users").doc(userData['email']).set({
        'email': userData['email'],
        'password': userData['name'],
        'phoneNumber': "",
      }).then((value) => Get.snackbar('Irasshaimase!', 'Logged in successfully',
          duration: const Duration(milliseconds: 2000),
          backgroundColor: const Color.fromARGB(126, 255, 255, 255)));
    }
    on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString(),
          duration: const Duration(milliseconds: 2000),
          backgroundColor: const Color.fromARGB(126, 255, 255, 255));
    }
     //Navigator.of(context) not working!
    
  }

 

}