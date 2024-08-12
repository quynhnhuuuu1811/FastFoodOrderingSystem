import 'package:fastfood_ordering_system/core/constant/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../config/routes.dart';
import '../../features/auth/bloc/auth_bloc.dart';
import '../../utils/validate.dart';
import '../widget/RoundedButton.dart';
import '../widget/TextButtons.dart';
import '../widget/RoundedTextField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _checkpasswordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _fullnameController.dispose();
    _passwordController.dispose();
    _checkpasswordController.dispose();
    super.dispose();
  }

  void _handleSignUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        AuthRegisterStarted(
          phoneNumber: _phoneController.text,
          password: _passwordController.text,
          name: _fullnameController.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;

    Widget signUpWidget;
    if (authState.status == AuthStatus.initial) {
      signUpWidget = _buildInitialize(context);
    } else if (authState.status == AuthStatus.loading) {
      signUpWidget = _buildInLoading();
    } else if (authState.status == AuthStatus.success) {
      signUpWidget = _buildSuccessfully(context);
    } else {
      signUpWidget = _buildFailured(authState.message, context);
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/signUpbkg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.status == AuthStatus.success) {
                // Handle success case, e.g., navigate to another screen
              } else if (state.status == AuthStatus.failed) {
                // Handle failure case, e.g., show a snackbar
              }
            },
            child: signUpWidget,
          ),
        ],
      ),
    );
  }

  Center _buildInitialize(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: 350,
          height: 700,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Đăng ký',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontFamily: 'Shopee_Bold',
                    ),
                  ),
                  const SizedBox(height: 20),
                  RoundedTextField(
                    controller: _phoneController,
                    hintText: 'Nhập số điện thọai',
                    icon: Icons.phone,
                    isPassword: false,
                    selectColor: Colors.white,
                    keyboardType: TextInputType.phone,
                    hintTextColor: AppColors.grayColor,
                    textInputAction: TextInputAction.next,
                    validator: validatePhoneNumber,
                  ),
                  RoundedTextField(
                    controller: _fullnameController,
                    hintText: 'Nhập họ và tên',
                    icon: Icons.account_box,
                    isPassword: false,
                    selectColor: Colors.white,
                    keyboardType: TextInputType.name,
                    hintTextColor: AppColors.grayColor,
                    textInputAction: TextInputAction.next,
                    validator: validateFullName,
                  ),
                  RoundedTextField(
                    controller: _passwordController,
                    hintText: 'Nhập mật khẩu (ít nhất 8 ký tự)',
                    icon: Icons.key,
                    isPassword: true,
                    selectColor: Colors.white,
                    keyboardType: TextInputType.text,
                    hintTextColor: AppColors.grayColor,
                    textInputAction: TextInputAction.next,
                    validator: validatePassword,
                  ),
                  RoundedTextField(
                    controller: _checkpasswordController,
                    hintText: 'Nhập lại mật khẩu',
                    icon: Icons.check,
                    isPassword: true,
                    selectColor: Colors.white,
                    keyboardType: TextInputType.text,
                    hintTextColor: AppColors.grayColor,
                    textInputAction: TextInputAction.done,
                    validator: (value) =>
                        validateConfirmPassword(_passwordController.text, value),
                  ),
                  const SizedBox(height: 30),
                  RoundedButton(
                    buttonColor: Colors.white,
                    buttonText: 'Đăng kí ngay',
                    fontSize: 20,
                    textColor: Colors.black,
                    onpressed: () {
                      _handleSignUp(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(180, 10, 0, 10),
                    child: TextButtons(
                      text: "Quay về",
                      textColor: Colors.white,
                      textSize: 20,
                      onpressed: () {
                        context.go(RouteName.login);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center _buildInLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Center _buildFailured(String? message, BuildContext context) {
    return Center(
      child: AlertDialog(
        title: const Text('Register failed'),
        content: Text(message ?? 'Failed'),
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(AuthStarted());
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Center _buildSuccessfully(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: const Text('Register completed'),
        content: const Text('Register successfully'),
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(AuthStarted());
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
