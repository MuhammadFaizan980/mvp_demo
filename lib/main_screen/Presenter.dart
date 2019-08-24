import 'IModel.dart';
import 'IPresenter.dart';
import 'IView.dart';
import 'Model.dart';

class Presenter implements IPresenter {
  IView _mView;
  IModel _mModel;

  Presenter(this._mView);

  @override
  void initValidation(String email, String password) {
    _mModel = Model(email, password);
    _mView.onValidationResult(_mModel.validateUser());
  }
}
