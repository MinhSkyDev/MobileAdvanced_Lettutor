import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:lettutor/common_component/common_header_text.dart";
import "package:lettutor/common_component/login_button.dart";
import "package:lettutor/common_component/login_textfield.dart";
import "package:lettutor/dashboard/ui/dashboard.dart";
import "package:lettutor/login/bloc/bloc/login_bloc.dart";
import "package:lettutor/register/ui/register.dart";
import "package:social_login_buttons/social_login_buttons.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameInput = TextEditingController();
  final passwordInput = TextEditingController();
  final loginBloc = LoginBloc();

  @override
  void initState() {
    loginBloc.add(LoginOnInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocConsumer<LoginBloc, LoginState>(
        bloc: loginBloc,
        listener: (context, state) {
          if (state is LoginSiginLoadedSucces) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardScreen()));
          } else if (state is LoginMoveToRegisterScreen) {
            moveToRegisterScreen();
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoginSigninLoading:
              return const Center(child: CircularProgressIndicator());
            default:
              return LoginInitialView();
          }
        },
      ),
    ));
  }

  void onSigninButton() {
    loginBloc.add(LoginOnSigninClickButtonEvent());
  }

  void onRegisterTextButtonPress() {
    loginBloc.add(LoginOnRegisterTextPressEvent());
  }

  void onMoveToRegisterTextInput() {}

  Center LoginInitialView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextHeader1("Say hello to your English tutors"),
            const SizedBox(height: 5),
            TextHeader3(
                "Become fluent faster through one on one video chat lessons tailored to your goals"),
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
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    onRegisterTextButtonPress();
                  },
                  child:
                      TextCommonBold("Haven't registered yet? Register Now!"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: TextCommon("Forgot password?"),
                ),
              ],
            ),
            const SizedBox(height: 25),
            LoginButton(onTap: onSigninButton),
            const SizedBox(height: 5),
            TextHeader2("Or sign in with"),
            const SizedBox(
              height: 5,
            ),
            SocialLoginButton(
              buttonType: SocialLoginButtonType.google,
              onPressed: () {},
              mode: SocialLoginButtonMode.multi,
            ),
            const SizedBox(height: 15),
            SocialLoginButton(
              buttonType: SocialLoginButtonType.facebook,
              onPressed: () {},
              mode: SocialLoginButtonMode.multi,
            ),
          ],
        ),
      ),
    );
  }

  void moveToRegisterScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()));
  }
}
