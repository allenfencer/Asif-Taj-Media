import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/utils/utils.dart';

class LoginProvider with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  login(BuildContext context, String email, String password) async {
    setLoading(true);
    try {
      auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        setLoading(false);
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.dashboardScreen, (route) => false);
      });
    } catch (e) {
      setLoading(false);
      Utils.showToast(e.toString());
    }
  }

  logout(BuildContext context) async {
    setLoading(true);
    try {
      auth.signOut().then((value) {
        setLoading(false);
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.loginScreen, (route) => false);
      });
    } catch (e) {
      Utils.showToast(e.toString());
    }
  }
}
