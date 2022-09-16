// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:login_page/constant/constant.dart';
// import 'package:login_page/controller/auth_controller.dart';

// class Register extends StatefulWidget {
//   const Register({Key? key}) : super(key: key);

//   @override
//   State<Register> createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   final TextEditingController _emailController = TextEditingController();

//   final TextEditingController _passwordController = TextEditingController();
//   final AuthController _con =Get.put(AuthController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Register"),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             decoration: const InputDecoration(hintText: "Email"),
//             controller: _emailController,
//           ),
//           TextField(
//             decoration: const InputDecoration(hintText: "Password"),
//             controller: _passwordController,
//             obscureText: true,
//           ),
//           const SizedBox(height: 30),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               ElevatedButton(
//                 onPressed: () async {
//                   _con.register(_emailController.text.trim(),
//                       _passwordController.text.trim());
//                 },
//                 child: const Text("Sign Up"),
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   _con.login(_emailController.text.trim(),
//                       _passwordController.text.trim());
//                 },
//                 child: const Text("Login"),
//               ),
//             ],
//           ),
//           const SizedBox(height: 30),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.red,
//             ),
//             onPressed: () {
//               _con.signInWithGoogle();
//             },
//             child: const Text("Sign In with Google"),
//           ),
//         ],
//       ),
//     );
//   }
// }