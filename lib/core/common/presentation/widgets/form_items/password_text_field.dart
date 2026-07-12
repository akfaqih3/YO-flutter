import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String placeholder;
  final IconData? prefixIcon;
  final Color fillColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final TextStyle textStyle;
  final TextEditingController? controller;
  final Color? iconColor;
  final AutovalidateMode autovalidateMode;

  const PasswordTextField({
    Key? key,
    this.placeholder = 'كلمة المرور',
    this.prefixIcon,
    this.fillColor = Colors.white,
    this.borderColor = const Color(0xFFE0E0E0),
    this.focusedBorderColor = const Color(0xFFBDBDBD),
    this.textStyle = const TextStyle(color: Colors.black87),
    this.controller,
    this.iconColor,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late FocusNode _focusNode;
  bool _hasFocus = false;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()
      ..addListener(() => setState(() => _hasFocus = _focusNode.hasFocus));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    if (value.length < 8) {
      return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
    }
    // تحقق من احتواء كلمة المرور على حروف وأرقام
    final strongRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    if (!strongRegex.hasMatch(value)) {
      return 'يجب أن تحتوي كلمة المرور على حروف وأرقام';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: _hasFocus
              ? [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))]
              : [],
          borderRadius: BorderRadius.circular(50),
        ),
        child: TextFormField(
          focusNode: _focusNode,
          controller: widget.controller,
          keyboardType: TextInputType.visiblePassword,
          obscureText: _obscureText,
          autovalidateMode: widget.autovalidateMode,
          style: widget.textStyle,
          decoration: InputDecoration(
            labelText: widget.placeholder,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            filled: true,
            fillColor: widget.fillColor,
            prefixIcon: Icon(widget.prefixIcon ?? Icons.lock, color: widget.iconColor ?? Colors.black54),
            suffixIcon: IconButton(
              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: widget.iconColor ?? Colors.black54),
              onPressed: () => setState(() => _obscureText = !_obscureText),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide(color: widget.borderColor, width: 1.5)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide(color: widget.borderColor, width: 1.5)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide(color: widget.focusedBorderColor, width: 1)),
            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide(color: Colors.red, width: 1.5)),
            focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide(color: Colors.red, width: 1)),
          ),
          validator: _validatePassword,
        ),
      ),
    );
  }
}
