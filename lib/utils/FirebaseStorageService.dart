import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService{
  final  _firebaseStorage = FirebaseStorage.instance;

 Future<String> uploadImage(File image) async {
    try {
      var imageName = DateTime.now().millisecondsSinceEpoch.toString();
      var storageRef =  _firebaseStorage.ref().child('upload/$imageName.jpg');

      // Tải hình lên Firebase
      var uploadTask = storageRef.putFile(image);

      // Chờ cho đến khi tệp được tải lên sau đó lưu trữ url tải xuống
      var snapshot = await uploadTask;
      var downloadUrl = await snapshot.ref.getDownloadURL();

      // Trả về url tải xuống
      return downloadUrl;
    } catch (e) {
      print('Error uploading file: $e');
      rethrow; // Rethrow để cho phép các phần khác của ứng dụng xử lý lỗi này nếu cần
    }
  }

}