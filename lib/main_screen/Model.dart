import 'IModel.dart';

class Model implements IModel {
  String _email;
  String _password;

  Model(this._email, this._password);

  @override
  bool validateUser() {
    return _email.isNotEmpty && _password.isNotEmpty && _password.length >= 6;
  }
}
