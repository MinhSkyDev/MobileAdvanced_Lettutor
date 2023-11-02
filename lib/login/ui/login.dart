import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:lettutor/common_component/login_button.dart";
import "package:lettutor/common_component/login_textfield.dart";
import "package:lettutor/dashboard/ui/dashboard.dart";
import "package:lettutor/login/bloc/bloc/login_bloc.dart";

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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardScreen()));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoginSigninLoading:
              return Center(child: CircularProgressIndicator());
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

  Center LoginInitialView() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Say hello to your English tutors",
              style: TextStyle(color: Colors.blueAccent, fontSize: 35),
            ),
            const SizedBox(height: 5),
            Text(
              "Become fluent faster through one on one video chat lessons tailored to your goals",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Username"),
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
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Password"),
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
                  onTap: () {},
                  child: Text("Forgot password?"),
                ),
              ],
            ),
            const SizedBox(height: 25),
            LoginButton(onTap: onSigninButton),
          ],
        ),
      ),
    );
  }
}
