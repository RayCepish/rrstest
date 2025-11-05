import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rockettest/presentation/bloc/auth_bloc.dart';

class AppLoaderOverlay extends StatelessWidget {
  const AppLoaderOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthBloc, AuthState, bool>(
      selector: (state) => state.isLoading,
      builder: (context, isLoading) {
        if (!isLoading) return const SizedBox.shrink();
        return Container(
          color: Colors.black54,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        );
      },
    );
  }
}
