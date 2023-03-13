import 'package:flutter/material.dart';

import 'custoom_shake_widget.dart';

class AnimatedTextFields extends StatefulWidget {
  const AnimatedTextFields({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedTextFields> createState() => _AnimatedTextFieldsState();
}

class _AnimatedTextFieldsState extends State<AnimatedTextFields> {
  late GlobalKey<FormState> _formKey;
  late GlobalKey<CustomShakeWidgetState> _emailIDState;
  late GlobalKey<CustomShakeWidgetState> _passwordState;
  late TextEditingController _emailEditingController;
  late TextEditingController _passwordEditingController;

  @override
  void initState() {
    _formKey = GlobalKey();
    _emailIDState = GlobalKey();
    _passwordState = GlobalKey();
    _emailEditingController = TextEditingController(text: "");
    _passwordEditingController = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _emailIDState.currentState?.dispose();
    _passwordState.currentState?.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Shake Effect Demo"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                CustomShakeWidget(
                  key: _emailIDState,
                  duration: const Duration(milliseconds: 800),
                  shakeCount: 4,
                  shakeOffset: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _emailEditingController,
                      decoration: const InputDecoration(
                        labelText: "Email id",
                      ),
                      validator: (value) {
                        if (value?.isNotEmpty == true) {
                          return "Email id is Invalid";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                CustomShakeWidget(
                  key: _passwordState,
                  duration: const Duration(milliseconds: 800),
                  shakeCount: 4,
                  shakeOffset: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _passwordEditingController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value?.isNotEmpty == true) {
                          return "Password was Incorrect";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    _formKey.currentState?.validate();
                    if (_emailEditingController.text.isEmpty ||
                        _passwordEditingController.text.isEmpty) {
                      _emailIDState.currentState?.shake();
                      _passwordState.currentState?.shake();
                    }
                  },
                  child: const Text("Log In"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
