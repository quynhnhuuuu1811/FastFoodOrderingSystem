import 'package:fastfood_ordering_system/screen/accountPage/widgets/EditAlertDialog.dart';
import 'package:fastfood_ordering_system/screen/accountPage/widgets/InformationItem.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/routes.dart';
import '../../core/constant/app_color.dart';
import '../widget/CustomeIconButton.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  void _showEditOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditAlertDialog();
      },
    );
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
          onPressed: () {
            context.go(RouteName.home);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CustomeIconButton(
              onpressed: _showEditOptionsDialog,
              color: Colors.black,
              icon: Icons.edit,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            InformationItem(
              title: 'Tên',
              content: 'Nguyễn Văn A',
              isPassword: false,
            ),
            InformationItem(
              title: 'Số điện thoại',
              content: '0123123123',
              isPassword: false,
            ),
            InformationItem(
              title: 'Mật khẩu',
              content: 'nguyenvana123',
              isPassword: true,
            ),
          ],
        ),
      ),
    );
  }
}

