import 'package:flutter/material.dart';

class TextoFormComponent extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icone;
  final String? Function(String?)? validator;
  final bool isObscure;
  final bool? needIcon;

  const TextoFormComponent({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icone,
    required this.validator,
    required this.isObscure,
    required this.needIcon,
  });

  @override
  State<TextoFormComponent> createState() => _TextoFormComponentState();
}

class _TextoFormComponentState extends State<TextoFormComponent> {
  bool isCurrentObscured = false;

  @override
  void initState() {
    isCurrentObscured = widget.isObscure ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscureText: isCurrentObscured ? true : false,
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icone),
        suffixIcon: widget.needIcon!
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isCurrentObscured = !isCurrentObscured;
                  });
                },
                icon: Icon(
                  !isCurrentObscured
                      ? Icons.visibility
                      : Icons.visibility_off_outlined,
                  color: Colors.black,
                ),
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        label: Text(
          widget.labelText,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
        contentPadding: EdgeInsets.all(16),
      ),
    );
  }
}
