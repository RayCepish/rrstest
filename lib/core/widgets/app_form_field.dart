import 'package:flutter/material.dart';

class AppFormField extends StatefulWidget {
  final String label;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool enabledValidation;

  const AppFormField({
    super.key,
    required this.label,
    required this.validator,
    required this.onChanged,
    required this.onSaved,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.enabledValidation = true,
  });

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: (value) =>
          widget.enabledValidation ? widget.validator?.call(value) : null,
      onSaved: widget.onSaved,
      builder: (field) {
        return TextField(
          obscureText: _obscure,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            labelText: widget.label,
            errorText: field.errorText,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() => _obscure = !_obscure);
                    },
                  )
                : null,
          ),
          onChanged: (val) {
            field.didChange(val);
            widget.onChanged?.call(val);
          },
        );
      },
    );
  }
}
