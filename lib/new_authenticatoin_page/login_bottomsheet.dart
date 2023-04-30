import 'package:flutter/material.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({super.key, required this.aniamtion});
  final Animation<double> aniamtion;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          height: 4,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey),
        ),
        const SizedBox(height: 20),
        ScaleTransition(
          scale: aniamtion,
          child: const Text(
            "Login",
            style: TextStyle(
                color: Color.fromARGB(255, 100, 63, 156),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFormField(
            decoration: InputDecoration(
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                hintText: 'Email',
                fillColor: Colors.grey.withOpacity(0.2)),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                hintText: 'Password',
                fillColor: Colors.grey.withOpacity(0.2)),
          ),
        ),
        const SizedBox(height: 60),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 100, 63, 156)),
            child: const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
