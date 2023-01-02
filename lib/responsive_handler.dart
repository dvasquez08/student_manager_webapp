import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:student_manager/Web_UI.dart';
import 'package:student_manager/loginScreen.dart';
import 'package:student_manager/mobile_ui.dart';
import 'package:student_manager/view_model.dart';

// This dart file determines which screen is seen first. It determines what will
// happen if authentication is successful or not. It also determines which screen
// will be shown depending on the size of the screen. The mobile screens have not
// been completed yet but this will be done in the future.

class responsiveHandler extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelProvider = ref.watch(viewModel);
    viewModelProvider.isLoggedIn();

    if (viewModelProvider.isSignedIn == true) {
      return LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return webView();
        } else
          return Mobile_Ui();
      });
    } else {
      return loginscreen();
    }
  }
}
