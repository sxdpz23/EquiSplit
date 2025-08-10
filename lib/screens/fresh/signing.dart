import 'package:equisplit/constants/colorConstants.dart';
import 'package:equisplit/constants/constants.dart';
import 'package:equisplit/constants/helperFunctions.dart';
import 'package:equisplit/models/fabButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signing extends StatelessWidget {
  final bool isLogin;
  Signing({super.key, required this.isLogin});

  late String email, password;

  Future _signIn({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      late String errorMsg;
      if (e.code == 'user-not-found') {
        errorMsg = "No user found for that email. Switching to signing up a new user.";
      } else if (e.code == 'wrong-password') {
        errorMsg = "Wrong password provided for that user.";
      }
      throw Exception(errorMsg);
    } catch (e) {
      rethrow;
    }
  }

  Future _signUp({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      late String errorMsg;
      if (e.code == 'weak-password') {
        errorMsg = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        errorMsg = "The account already exists for that email.";
      }
      throw Exception(errorMsg);
    } catch (e) {
      rethrow;
    }
  }

  _signOut() async => await FirebaseAuth.instance.signOut();

  @override
  Widget build(BuildContext context) {
    List<FabButton> fabBtns = Constants.signInFabButtons;

    void callSnackBar(String message) {
      if(context.mounted && message.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Some error occurred :: $message"))
        );
      }
    }

    void proceedAction() {
      String? onError;
      (isLogin
          ? _signIn(email: email, password: password)
          : _signUp(email: email, password: password)).catchError((err) {
        callSnackBar(err.toString());
      });
    }

    return Scaffold(
      backgroundColor: ColorConstants.appBarBG,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 20.0,
        backgroundColor: ColorConstants.appBarBG,
        centerTitle: false,
        flexibleSpace: const SizedBox(height: 200.0),
        title: const Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Text(
              Constants.APP_NAME,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: ColorConstants.appBarTXT,
                fontSize: 32.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(40.0, 40.0, 15.0, 0.0),
        alignment: Alignment.topRight,
        child: const Text(
          Constants.APP_DESC,
          softWrap: true,
          textAlign: TextAlign.end,
          style: TextStyle(
            color: ColorConstants.pageTXT,
            fontStyle: FontStyle.italic,
            fontSize: 20.0,
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(
            fabBtns.length,
                (int index) {
              String? action = fabBtns[index].namedAction.isNotEmpty
                  ? fabBtns[index].namedAction
                  : null;
              return HelperFunctions.createFAB(
                text: fabBtns[index].title,
                action: () => (action==null)
                    ? proceedAction()
                    : Navigator.pushNamed(context, fabBtns[index].namedAction),
              );
            },
          ),
        ),
      ),
    );
  }
}
