import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rockettest/core/widgets/app_loader_overlay.dart';
import 'package:rockettest/presentation/auth/widgets/signIn_tab.dart';
import 'package:rockettest/presentation/auth/widgets/signUp_tab.dart';
import 'package:rockettest/presentation/bloc/auth_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error!)));
        }
        if (state.isAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('✅ Login successful'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                backgroundColor: Colors.white,
                bottom: TabBar(
                  controller: tabController,
                  tabs: const [
                    Tab(text: 'Login'),
                    Tab(text: 'Register'),
                  ],
                ),
              ),
              body: TabBarView(
                controller: tabController,
                children: [
                  SignInTab(
                    onSubmit: (email, password) {
                      context.read<AuthBloc>().add(
                        SignInRequestedEvent(email, password),
                      );
                    },
                  ),
                  SignUpTab(
                    isLoading: state.isLoading,
                    onSubmit: (email, password, confirm) {
                      context.read<AuthBloc>().add(
                        SignUpRequestedEvent(email, password),
                      );
                    },
                  ),
                ],
              ),
            ),
            AppLoaderOverlay(),
          ],
        );
      },
    );
  }
}
