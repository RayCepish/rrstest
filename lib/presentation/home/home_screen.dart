import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rockettest/core/widgets/app_loader_overlay.dart';
import 'package:rockettest/presentation/bloc/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
            backgroundColor: Colors.white,
          ),
          body: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (!state.isAuthenticated) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('👋 You have been logged out'),
                    backgroundColor: Colors.orange,
                  ),
                );
              }
            },
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome {username}", style: textTheme.headlineMedium),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.logout),
                      label: const Text("Logout"),
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          const SignOutRequestedEvent(),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        AppLoaderOverlay(),
      ],
    );
  }
}
