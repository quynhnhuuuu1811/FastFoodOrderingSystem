
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/bloc/auth_bloc.dart';
import '../screen/homepage/HomePageScreen.dart';
import '../screen/signInPage/signInScreen.dart';

class RouteName{
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const publicRoutes = [
    login,
    register,
  ];
}

final router =GoRouter(
    redirect: (context, state) {
      if (RouteName.publicRoutes.contains(state.fullPath)) {
        return null;
      }
      if (context.read<AuthBloc>().state.status == AuthStatus.success) {
        return null;
      }
      return RouteName.login;
    },
    routes: [
      GoRoute(path: RouteName.login,
            builder: (context, state) => SignInScreen(),
      ),
      GoRoute(path: RouteName.home,
        builder: (context, state) => HomePageScreen(),
      ),
    ]
);