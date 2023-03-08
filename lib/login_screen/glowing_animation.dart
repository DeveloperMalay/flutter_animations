import 'package:flutter/material.dart';

class GlowingLoginButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const GlowingLoginButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _GlowingLoginButtonState createState() => _GlowingLoginButtonState();
}

class _GlowingLoginButtonState extends State<GlowingLoginButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF00FFFF),
              Color(0xFF0080FF),
            ],
          ),
          boxShadow: _isPressed
              ? []
              : [
                  BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 4,
                      offset: const Offset(0, 0)),
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    blurRadius: 30,
                    spreadRadius: 4,
                    offset: const Offset(0, 0),
                  ),
                ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
