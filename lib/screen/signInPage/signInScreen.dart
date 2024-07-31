import 'package:fastfood_ordering_system/core/constant/app_color.dart';
import 'package:fastfood_ordering_system/screen/homepage/widgets/HomePageScreen.dart';
import 'package:fastfood_ordering_system/screen/signInPage/widgets/Register.dart';
import 'package:fastfood_ordering_system/screen/widget/TextField.dart';
import 'package:fastfood_ordering_system/utils/validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<AuthBloc,AuthState>(

        builder: (context,state) {

          final initialLoginWidget=  Padding(
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
                            isPassword: false,
                            selectColor: Colors.black,
                            keyboardType: TextInputType.text,
                            hintTextColor: AppColors.grayColor,
                            textInputAction: TextInputAction.done,
                            validator: validatePassword,
                          ),
                          const SizedBox(height: 20), // Add more space if needed
                          SizedBox(height: 20),
                          RoundedButton(
                              buttonText: 'Đăng nhập',
                              textColor: Colors.white,
                              buttonColor: Colors.black,
                              onpressed: () {
                                _handleSignIn(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomePageScreen()),
                                );
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
          const inLoadingWidget=Center(
            child: CircularProgressIndicator(),
          );
          return (switch(state.status){
            AuthStatus.initial=>  initialLoginWidget,
            AuthStatus.loading=> inLoadingWidget,
            AuthStatus.success=> CircularProgressIndicator(),
            AuthStatus.failed=> CircularProgressIndicator(),
          });
        }
      ),
    );
  }
}
