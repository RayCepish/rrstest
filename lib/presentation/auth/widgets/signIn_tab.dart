import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rockettest/core/validators/form_validators.dart';
import 'package:rockettest/core/widgets/app_form_field.dart';

class SignInTab extends StatefulWidget {
  final Function(String email, String password) onSubmit;

  const SignInTab({required this.onSubmit, super.key});

  @override
  State<SignInTab> createState() => _SignInTabState();
}

class _SignInTabState extends State<SignInTab> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool isSubmitting = false;
  bool isFormValid = false;

  bool emailDirty = false;
  bool passwordDirty = false;

  void _onChanged() {
    final isValid = formKey.currentState?.validate() ?? false;
    setState(() => isFormValid = isValid);
  }

  Future<void> _onSubmit() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    formKey.currentState?.save();
    setState(() => isSubmitting = true);

    await widget.onSubmit(email, password);

    if (mounted) setState(() => isSubmitting = false);
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
              validator: (value) {
                if (!emailDirty) return null;
                return FormValidators.email(value);
              },
              keyboardType: TextInputType.emailAddress,
              onSaved: (val) => email = val!.trim(),
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
              onSaved: (val) => password = val!.trim(),
              onChanged: (val) {
                if (!passwordDirty) setState(() => passwordDirty = true);
                password = val;
                _onChanged();
              },
            ),
            SizedBox(height: 30.h),

            ElevatedButton(
              onPressed: (!isSubmitting && isFormValid) ? _onSubmit : null,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
