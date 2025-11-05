import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rockettest/core/theme/app_theme.dart';
import 'package:rockettest/dependency_injection/setup_dependency.dart';
import 'package:rockettest/presentation/bloc/auth_bloc.dart';
import 'package:rockettest/presentation/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependency();
  await dotenv.load(fileName: ".env");

  final authBloc = getIt<AuthBloc>()..add(AuthStarted());

  runApp(MyApp(authBloc: authBloc));
}

class MyApp extends StatelessWidget {
  final AuthBloc authBloc;
  const MyApp({super.key, required this.authBloc});

  @override
  Widget build(BuildContext context) {
    final router = buildRouter(authBloc);

    return BlocProvider.value(
      value: authBloc,
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: TAppTheme.theme,
        ),
      ),
    );
  }
}
