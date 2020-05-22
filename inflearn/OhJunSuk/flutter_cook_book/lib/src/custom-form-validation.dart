import 'package:flutter/material.dart';

class CustomFormValidation extends StatefulWidget {
  static const routeName = '/custom-form-validation';
  @override
  _CustomFormValidationState createState() => _CustomFormValidationState();
}

class _CustomFormValidationState extends State<CustomFormValidation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode textFieldFocusNode = FocusNode();

  @override
  void dispose() {
    textFieldFocusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Form Validation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return '값이 없습니다.';
                  } else
                    return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content: Text('Processing'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                ),
              ),
              TextField(
                onChanged: (value) {
                  textEditingController.text = value;
                },
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: InputBorder.none,
                  labelText: 'Name',
                ),
                focusNode: textFieldFocusNode,
                autofocus: true,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(textFieldFocusNode);
                  },
                  child: Text('Get Focus'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('New Alert Dialog'),
                          content: Text('${textEditingController.text}'),
                          actions: <Widget>[
                            RaisedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Dismiss'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Make Alert Dialog'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
