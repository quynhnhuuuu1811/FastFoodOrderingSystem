import 'package:go_router/go_router.dart';

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
  redirect:(context, state){
    if(RouteName.publicRoutes.contains(state.fullPath)){
      return null;
    }
    //If user is not login
    return RouteName.login;
  },
    routes: [
      GoRoute(path: RouteName.login,
            builder: (context, state) => SignInScreen(),
      ),
    ]
);