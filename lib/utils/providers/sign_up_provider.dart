import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tech_media/utils/routes/route_name.dart';

import '../utils.dart';

class SignUpProvider with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('Users');

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future signUp(BuildContext context, String username, String email,
      String password) async {
    setLoading(true);
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        ref.child(value.user!.uid.toString()).set({
          'uid': value.user!.uid.toString(),
          'email': value.user!.email,
          'userName': username,
          'profile-pic': '',
          'status': 'None',
        }).then((value) {
          setLoading(false);
          Utils.showToast('User created successfully');
          Navigator.pushNamedAndRemoveUntil(
              context, RouteName.dashboardScreen, (route) => false);
        });
      });
    } catch (e) {
      setLoading(false);
      Utils.showToast(e.toString());
    }
  }
}
