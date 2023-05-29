
import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/model/user_model.dart';

class UserService {
  CollectionReference reference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      reference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'role':user.role,
       
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUser(String id) async {
    try {
      DocumentSnapshot snapshot = await reference.doc(id).get();
      return UserModel(
          id: id,
          name: snapshot['name'],
          email: snapshot['email'],
          role: snapshot['role']
      );
    } catch (e) {
      rethrow;
    }
  }
}