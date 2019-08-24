import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'IPresenter.dart';
import 'IView.dart';
import 'Presenter.dart';

main() => runApp(
      new MaterialApp(
        home: new StFull(),
      ),
    );

class StFull extends StatefulWidget {
  @override
  _StFullState createState() => _StFullState();
}

class _StFullState extends State<StFull> implements IView {
  IPresenter _presenter;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _presenter = Presenter(this);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("MVP Demo"),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(top: 64),
            ),
            new Container(
              margin: new EdgeInsets.only(left: 16, right: 16),
              child: new TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                  labelText: "Enter email",
                  border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(left: 16, right: 16, top: 16),
              child: new TextField(
                controller: passwordController,
                obscureText: true,
                decoration: new InputDecoration(
                  labelText: "Enter password",
                  border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            new Expanded(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.all(16),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new RaisedButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(8),
                            ),
                            onPressed: () {
                              _presenter.initValidation(emailController.text, passwordController.text);
                            },
                            color: Theme.of(context).primaryColor,
                            child: new Text(
                              "Validate",
                              style: new TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  onValidationResult(bool isValidUser) {
    if (isValidUser) {
      Toast.show('Valid user', context, duration: Toast.LENGTH_SHORT);
    } else {
      Toast.show('Invalid user', context, duration: Toast.LENGTH_SHORT);
    }
  }
}
