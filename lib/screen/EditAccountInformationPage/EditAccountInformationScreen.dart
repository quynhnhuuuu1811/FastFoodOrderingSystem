import 'package:fastfood_ordering_system/screen/EditAccountInformationPage/widgets/EditAccountInformationItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constant/app_color.dart';
import '../../features/user/bloc/user_bloc.dart';
import '../../utils/token.dart';
import '../widget/RoundedButton.dart';

class EditAccountInformationScreen extends StatefulWidget {
  const EditAccountInformationScreen({super.key});

  @override
  State<EditAccountInformationScreen> createState() => _EditAccountInformationScreenState();
}

class _EditAccountInformationScreenState extends State<EditAccountInformationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  int userId = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadUserId().then((o)=> userId);
    final userState = context.watch<UserBloc>().state;
    _nameController.text = userState.user.name;
    _phoneController.text = userState.user.phoneNumber;
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
            context.pop();
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
              const SizedBox(height: 30),
              RoundedButton(
                onpressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  context.read<UserBloc>().add(UpdateUserInfor(userId, _nameController.text, _phoneController.text));
                  if(context.read<UserBloc>().state.status == UserStatus.success){
                    ScaffoldMessenger.of(context).showSnackBar(buildSnackBar('Cập nhật thông tin thành công'));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(buildSnackBar('Cập nhật thông tin thất bại'));
                  }
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

  SnackBar buildSnackBar(String message) {
    return  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.black,
    );
  }
}
