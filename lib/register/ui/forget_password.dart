import 'package:flutter/material.dart';
import 'package:lettutor/common_component/common_header_text.dart';
import 'package:lettutor/common_component/common_rounded_button.dart';
import 'package:lettutor/common_component/login_textfield.dart';
import 'package:lettutor/register/bloc/bloc/register_bloc.dart';
import 'package:lettutor/util/auth_request.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final usernameInput = TextEditingController();
  final passwordInput = TextEditingController();
  final reEnterPasswordInput = TextEditingController();
  RegisterBloc registerBloc = RegisterBloc();
  @override
  Widget build(BuildContext context) {
    return ForgetPasswordView();
  }

  Widget ForgetPasswordView() {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextHeader1("Recover Password"),
                const SizedBox(height: 5),
                TextHeader3("Please enter your email to recover password!"),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextCommon("Username"),
                    ],
                  ),
                ),
                LoginTextField(
                  controller: usernameInput,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 25,
                ),
                RoundedButtonBold("Submit", () async {
                  int response = await forgetPassword(usernameInput.text);
                  if (response == 200) {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      title: 'Please check your email',
                      text: 'An email has been sent to you!',
                    );
                  } else {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
                      title: 'Oopps',
                      text: 'Something is wrong here!',
                    );
                  }
                }),
                const SizedBox(height: 25),
                RoundedButtonBold("Back", () {
                  Navigator.of(context).pop();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
