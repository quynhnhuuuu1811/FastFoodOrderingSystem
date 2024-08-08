import 'package:fastfood_ordering_system/screen/EditAccountInformationPage/widgets/EditAccountInformationItem.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/routes.dart';
import '../../core/constant/app_color.dart';
import '../widget/RoundedButton.dart';

class EditAccountInformationScreen extends StatefulWidget {
  const EditAccountInformationScreen({super.key});

  @override
  State<EditAccountInformationScreen> createState() => _EditAccountInformationScreenState();
}

class _EditAccountInformationScreenState extends State<EditAccountInformationScreen> {
  TextEditingController _nameController = TextEditingController(text:"Nguyễn Văn A");
  TextEditingController _phoneController = TextEditingController(text: "0123123123");

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
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
            context.go(RouteName.account);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
        child: Form(
          child: Column(
            children: [
              EditAccountInformationItem(
                title: 'Tên',
                controller: _nameController,
              ),
              EditAccountInformationItem(
                title: 'Số điện thoại',
                controller: _phoneController,
              ),
              SizedBox(height: 30),
              RoundedButton(
                onpressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Đổi thông tin thành công'),
                      backgroundColor: Colors.black,
                    ),
                  );
                },
                textColor: Colors.white,
                buttonText: 'Thay đổi',
                fontSize: 25,
                buttonColor: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
