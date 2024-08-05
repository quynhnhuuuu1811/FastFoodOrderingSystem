import 'package:fastfood_ordering_system/config/routes.dart';
import 'package:fastfood_ordering_system/core/constant/app_color.dart';
import 'package:fastfood_ordering_system/screen/homepage/HomePageScreen.dart';
import 'package:fastfood_ordering_system/screen/signInPage/widgets/Register.dart';
import 'package:fastfood_ordering_system/screen/widget/TextField.dart';
import 'package:fastfood_ordering_system/utils/validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/bloc/auth_bloc.dart';
import '../widget/RoundedButton.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn(BuildContext context) {
    if(_formKey.currentState!.validate()){
      context.read<AuthBloc>().add(
        AuthLoginStarted(
          phoneController.text,
          passwordController.text,
        ),
      );
    }
    // Navigator.push(context,MaterialPageRoute(builder: (context) => HomePageScreen()));
  }
  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    Widget loginWidget;
    if (authState.status == AuthStatus.initial) {
      loginWidget = _buildInitialize(context);
    } else if (authState.status == AuthStatus.loading) {
      loginWidget = _buildInLoading();
    } else if (authState.status == AuthStatus.success) {
      loginWidget= Container();
    } else {
      loginWidget = _buildFailured(authState.message, context);
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.success) {
            context.go(RouteName.home);
          } else if (state.status == AuthStatus.failed) {
            // Handle failure case, e.g., show a snackbar
          }
        },
        child: loginWidget,
      ),
    );
  }

  Padding _buildInitialize(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image Widget
            Center(
              child: Image.asset(
                'assets/images/logo_nentrang.png',
                height: 370,
                width: 370,
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    RoundedTextField(
                      controller: phoneController,
                      hintText: 'Nhập số điện thoại',
                      icon: Icons.account_box,
                      isPassword: false,
                      selectColor: Colors.black,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator:validatePhoneNumber ,
                      hintTextColor: AppColors.grayColor,
                    ),
                    RoundedTextField(
                      controller: passwordController,
                      hintText: 'Nhập mật khẩu',
                      icon: Icons.key,
                      isPassword: true,
                      selectColor: Colors.black,
                      keyboardType: TextInputType.text,
                      hintTextColor: AppColors.grayColor,
                      textInputAction: TextInputAction.done,
                      validator: validatePassword,
                    ),
                    const SizedBox(height: 20), // Add more space if needed
                    const SizedBox(height: 20),
                    RoundedButton(
                        buttonText: 'Đăng nhập',
                        textColor: Colors.white,
                        buttonColor: Colors.black,
                        onpressed: () {
                          _handleSignIn(context);
                        },
                        fontSize: 20
                    ),
                    const Register(),
                  ],
                )
            ),

          ],
        ),
      ),
    );
  }

  Center _buildFailured(message, BuildContext context) {
    return Center(
        child: AlertDialog(
          title:  const Text('Login failed'),
          content: Text(message??'failed'),
          backgroundColor: Colors.white,
          actions: [
            TextButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthStarted());
              },
              child:  const Text('OK'),
            ),
          ],

        )
    );
  }

  Center _buildInLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
