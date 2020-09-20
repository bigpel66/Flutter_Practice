import 'package:custom_dialog/enum/dialog_type.dart';
import 'package:custom_dialog/widgets/basic_custom_dialog.dart';
import 'package:custom_dialog/widgets/form_custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:custom_dialog/services/locator.dart';

void setupDialogUi() {
  final DialogService dialogService = locator<DialogService>();

  dialogService.registerCustomDialogBuilder(
    variant: DialogType.Basic,
    builder: (BuildContext context, DialogRequest dialogRequest) {
      return Dialog(
        child: BasicCustomDialog(
          dialogRequest,
          (DialogResponse dialogResponse) =>
              dialogService.completeDialog(dialogResponse),
        ),
      );
    },
  );

  dialogService.registerCustomDialogBuilder(
    variant: DialogType.Form,
    builder: (BuildContext context, DialogRequest dialogRequest) {
      return Dialog(
        child: FormCustomDialog(
            dialogRequest,
            (DialogResponse dialogResponse) =>
                dialogService.completeDialog(dialogResponse)),
      );
    },
  );
}
