import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/routes.dart';
import '../../core/constant/app_color.dart';
import '../../features/user/bloc/user_bloc.dart';
import '../../utils/token.dart';
import '../widget/RoundedButton.dart';
import 'widgets/EditPasswordItem.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final TextEditingController _oldPassController = TextEditingController();
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _checkNewPassController = TextEditingController();
  int userId = 0;

  @override
  void dispose() {
    _oldPassController.dispose();
    _newPassController.dispose();
    _checkNewPassController.dispose();
    super.dispose();
  }

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');
    if (token != null) {
      setState(() {
        userId = int.parse(getUserIdFromToken(token));
      });
    }
  }

  void _changePassword(String oldPass, String newPass, String checkNewPass) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (newPass != checkNewPass) {
      ScaffoldMessenger.of(context).showSnackBar(
        buildSnackBar('Mật khẩu không khớp'),
      );
    } else {
      context.read<UserBloc>().add(UpdatePassword(userId, newPass, oldPass));
      if(context.read<UserBloc>().state.status == UserStatus.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          buildSnackBar('Thay đổi mật khẩu thành công'),
        );
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          buildSnackBar(context.read<UserBloc>().state.message),
        );
    }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: const Text(
          'Thông tin cá nhân',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Shopee_Bold',
            color: Colors.black,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: AppColors.grayColor,
            height: 1.5,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Form(
            child: Column(
              children: [
                EditPasswordItem(
                  title: 'Nhập mật khẩu cũ',
                  controller: _oldPassController,
                ),
                EditPasswordItem(
                  title: 'Nhập mật khẩu mới',
                  controller: _newPassController,
                ),
                EditPasswordItem(
                  title: 'Nhập lại mật khẩu mới',
                  controller: _checkNewPassController,
                ),
                const SizedBox(height: 30),
                RoundedButton(
                  onpressed: () {
                    _changePassword(
                      _oldPassController.text,
                      _newPassController.text,
                      _checkNewPassController.text,
                    );
                  },
                  textColor: Colors.white,
                  buttonText: 'Thay đổi',
                  fontSize: 25,
                  buttonColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SnackBar buildSnackBar(String message) {
    return SnackBar(
      content: Text(message),
      backgroundColor: Colors.black,
    );
  }
}
