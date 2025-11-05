import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rockettest/core/validators/form_validators.dart';
import 'package:rockettest/core/widgets/app_form_field.dart';

class SignUpTab extends StatefulWidget {
  final void Function(String email, String password, String confirm) onSubmit;
  final bool isLoading;

  const SignUpTab({super.key, required this.onSubmit, this.isLoading = false});

  @override
  State<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String confirm = '';

  bool isFormValid = false;

  bool emailDirty = false;
  bool passwordDirty = false;
  bool confirmDirty = false;

  void _onChanged() {
    final isValid = formKey.currentState?.validate() ?? false;
    setState(() => isFormValid = isValid);
  }

  Future<void> _onSubmit() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    formKey.currentState?.save();
    widget.onSubmit(email, password, confirm);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppFormField(
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (!emailDirty) return null;
                return FormValidators.email(value);
              },
              onSaved: (v) => email = v!.trim(),
              onChanged: (val) {
                if (!emailDirty) setState(() => emailDirty = true);
                email = val;
                _onChanged();
              },
            ),
            SizedBox(height: 16.h),

            AppFormField(
              label: 'Password',
              obscureText: true,
              validator: (value) {
                if (!passwordDirty) return null;
                return FormValidators.password(value);
              },
              onSaved: (v) => password = v!.trim(),
              onChanged: (val) {
                if (!passwordDirty) setState(() => passwordDirty = true);
                password = val;
                _onChanged();
              },
            ),
            SizedBox(height: 16.h),

            AppFormField(
              label: 'Confirm Password',
              obscureText: true,
              validator: (value) {
                if (!confirmDirty) return null;
                if (password.trim().isEmpty) return null;
                return FormValidators.confirmPassword(value, password);
              },
              onSaved: (v) => confirm = v!.trim(),
              onChanged: (val) {
                if (!confirmDirty) setState(() => confirmDirty = true);
                confirm = val;
                _onChanged();
              },
            ),
            SizedBox(height: 30.h),

            ElevatedButton(
              onPressed: (isFormValid && !widget.isLoading) ? _onSubmit : null,
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
