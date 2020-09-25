import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../widgets/auth/auth-form.dart';

class AuthScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final _store = Firestore.instance;

  void _submitAuthForm(
    String email,
    String username,
    String password,
    File image,
    bool isLogin,
    BuildContext context,
  ) async {
    AuthResult authResult;
    try {
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        final StorageReference storageReference = FirebaseStorage.instance
            .ref()
            .child('user_image')
            .child('${authResult.user.uid}-${DateTime.now()}.png');
        final StorageUploadTask storageUploadTask = storageReference.putFile(
            image, StorageMetadata(contentType: 'image/png'));
        final StorageTaskSnapshot storageTaskSnapshot =
            await storageUploadTask.onComplete;
        String imageUrl = await storageTaskSnapshot.ref.getDownloadURL()
          ..toString();

        await _store.collection('users').document(authResult.user.uid).setData({
          'username': username,
          'email': email,
          'imageUrl': imageUrl,
        });
      }
    } on PlatformException catch (err) {
      var message = 'An error occured, please check your credentials';

      if (err.message != null) {
        message = err.message;
      }

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
          duration: Duration(seconds: 2),
        ),
      );
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(authCallback: _submitAuthForm),
    );
  }
}
