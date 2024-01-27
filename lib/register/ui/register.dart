import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/common_component/common_header_text.dart';
import 'package:lettutor/common_component/common_rounded_button.dart';
import 'package:lettutor/common_component/login_textfield.dart';
import 'package:lettutor/register/bloc/bloc/register_bloc.dart';
import 'package:lettutor/register/ui/forget_password.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameInput = TextEditingController();
  final passwordInput = TextEditingController();
  final reEnterPasswordInput = TextEditingController();
  RegisterBloc registerBloc = RegisterBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      bloc: registerBloc,
      listener: (context, state) {
        if (state is RegisterFailedRegisterState) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: 'Register failed...',
          );
        } else if (state is RegisterSuccessRegisterState) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            title: 'Yayyyy!',
            text: 'Register Successfully...',
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          default:
            {
              return RegisterLoginView();
            }
        }
      },
    );
  }

  void onRegister() {
    // RegisterRequest request = RegisterRequest(
    //     email: usernameInput.text, password: passwordInput.text, source: null);
    registerBloc.add(RegisterRegisterUserEvent(
        email: usernameInput.text, password: passwordInput.text));
  }

  Widget RegisterLoginView() {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  TextHeader1("Register Sreen"),
                  const SizedBox(height: 5),
                  TextHeader3("Register your account in Lettutor!"),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextCommon("Password"),
                      ],
                    ),
                  ),
                  LoginTextField(
                      controller: passwordInput,
                      hintText: "Password",
                      obscureText: true),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextCommon("Re-Enter Password"),
                      ],
                    ),
                  ),
                  LoginTextField(
                      controller: reEnterPasswordInput,
                      hintText: "Re-Enter Password",
                      obscureText: true),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          moveToForgetPasswordScreen();
                        },
                        child: TextCommon("Forgot your password?"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  RoundedButtonBold("Register", () {
                    onRegister();
                  }),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundedButtonBold("Login", () {
                    Navigator.pop(context);
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void moveToForgetPasswordScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ForgetPasswordScreen()));
  }
}
