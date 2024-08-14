import 'package:fastfood_ordering_system/features/user/bloc/user_bloc.dart';
import 'package:fastfood_ordering_system/features/user/data/user_repository.dart';
import 'package:fastfood_ordering_system/features/user/dtos/user_dto.dart';
import 'package:fastfood_ordering_system/screen/accountPage/widgets/EditAlertDialog.dart';
import 'package:fastfood_ordering_system/screen/accountPage/widgets/InformationItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/http_client.dart';
import '../../config/routes.dart';
import '../../core/constant/app_color.dart';
import '../../features/user/data/user_api_client.dart';
import '../../utils/token.dart';
import '../widget/CustomeIconButton.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String _userId='';

  void _showEditOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const EditAlertDialog();
      },
    );
  }

  @override
  void initState() {
    super.initState();
     _getUserId().then((value) {
      setState(() {
        _userId = value;
        context.read<UserBloc>().add(FetchUser(_userId));
      });
     });
  }

  Future<String> _getUserId() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    final jwt = sf.getString('accessToken');
    if (jwt == null) {
      throw Exception("JWT token not found");
    }
    return getUserIdFromToken(jwt);
  }

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserBloc>().state;
    if (userState.status == UserStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    } else if (userState.status == UserStatus.failure) {
      return const Center(child: Text('Failed to load user'));
    }
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
                  content: userState.user.name,
                  isPassword: false,
                ),
                InformationItem(
                  title: 'Số điện thoại',
                  content: userState.user.phoneNumber,
                  isPassword: false,
                ),
              ],
            ),
        ),
    );
  }
}
