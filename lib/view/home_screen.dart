import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_page/controller/auth_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController _con = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
  return Scaffold(
   appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                // this icon button is for the user to signout
              _con.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          } else if (snapshot.hasData) {
           var  user= FirebaseAuth.instance.currentUser;
           
            return  Center(
              child: Column(
               
                children: [
                  const SizedBox(
                    height: 200
                  ),
                 user!.photoURL==null?const SizedBox(): Image.network(user.photoURL.toString()),
                  const SizedBox(
                    height: 20
                  ),
                  Text(user.email.toString()),
                   const SizedBox(
                    height: 20
                  ),
                  Text(user.displayName??""),
                ],
              ),
            );

        }else{
          return Container();
         
        }
        })
    );
  }
}