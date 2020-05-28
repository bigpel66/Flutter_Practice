import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount _googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication _googleSignInAuthentication =
        await _googleSignInAccount.authentication;
    final AuthCredential _authCredential = GoogleAuthProvider.getCredential(
      idToken: _googleSignInAuthentication.idToken,
      accessToken: _googleSignInAuthentication.accessToken,
    );
    final AuthResult _authResult =
        await FirebaseAuth.instance.signInWithCredential(_authCredential);

    return _authResult.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Instagram Clone',
              style: GoogleFonts.pacifico(
                fontSize: 40.0,
              ),
            ),
            Container(
              margin: EdgeInsets.all(50.0),
            ),
            SignInButton(
              Buttons.Google,
              onPressed: () async {
                try {
                  await _handleSignIn();
                } on PlatformException catch (err) {
                  throw err;
                } catch (err) {
                  throw err;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
