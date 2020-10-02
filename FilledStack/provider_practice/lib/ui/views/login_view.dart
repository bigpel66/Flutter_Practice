import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/enums/enums.dart';
import 'package:provider_practice/services/authentication_service.dart';
import 'package:provider_practice/ui/views/views.dart';
import 'package:provider_practice/ui/shared/shared.dart';
import 'package:provider_practice/providers/providers.dart';
import 'package:provider_practice/ui/widgets/widgets.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginModel>(
      builder: (BuildContext context, LoginModel model, Widget child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              child,
              model.state == ViewState.Busy
                  ? CircularProgressIndicator()
                  : FlatButton(
                      color: Colors.white,
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        bool loginSuccess = await model.login(_controller.text);

                        if (loginSuccess) {
                          Navigator.pushNamed(context, '/');
                        }
                      },
                    ),
            ],
          ),
        );
      },
      model: LoginModel(
        authenticationService: Provider.of<AuthenticationService>(context),
      ),
      child: LoginHeader(controller: _controller),
    );
  }
}
