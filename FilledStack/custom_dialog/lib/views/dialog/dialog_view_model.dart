import 'package:custom_dialog/enum/dialog_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:custom_dialog/services/locator.dart';

class DialogViewModel extends BaseViewModel {
  final DialogService _dialogService = locator<DialogService>();

  bool _basicResult;
  bool get basicResult => _basicResult;

  bool _confirmationResult;
  bool get confirmationResult => _confirmationResult;

  bool _basicCustomResult;
  bool get basicCustomResult => _basicCustomResult;

  bool _formCustomResult;
  bool get formCustomResult => _formCustomResult;

  String _formCustomString;
  String get formCustomString => _formCustomString;

  // DialogResponse _dialogResponse;
  // DialogResponse get dialogResponse => _dialogResponse;

  Future showBasicDialog() async {
    DialogResponse response = await _dialogService.showDialog(
      title: '기본형 Dialog',
      description: '기본형 Dialog의 Description',
      cancelTitle: '취소',
      buttonTitle: '확인',
      barrierDismissible: true,
    );

    _basicResult = response?.confirmed;
    notifyListeners();
  }

  Future showConfirmationDialog() async {
    DialogResponse response = await _dialogService.showConfirmationDialog(
      title: '확인형 Dialog',
      description: '확인형 Dialog의 Description',
      cancelTitle: '취소',
      confirmationTitle: '확인',
      barrierDismissible: true,
    );

    _confirmationResult = response?.confirmed;
    notifyListeners();
  }

  Future showBasicCustomDialog() async {
    DialogResponse response = await _dialogService.showCustomDialog(
      variant: DialogType.Basic,
      title: '기본형 Custom Dialog',
      description: '기본형 Custom Dialog Description',
      mainButtonTitle: '확인',
      takesInput: true,
      barrierDismissible: true,
    );

    _basicCustomResult = response?.confirmed;
    notifyListeners();
  }

  Future showFormCustomDialog() async {
    DialogResponse response = await _dialogService.showCustomDialog(
      variant: DialogType.Form,
      title: '작성형 Custom Dialog',
      description: '작성형 Custom Dialog Description',
      mainButtonTitle: '확인',
      takesInput: true,
      barrierDismissible: true,
    );

    _formCustomResult = response?.confirmed;
    _formCustomString = response?.responseData[0];
    notifyListeners();
  }
}
