import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/home/bloc/bloc/home_bloc.dart';
import 'package:lettutor/login/ui/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HommeScreenState();
}

class _HommeScreenState extends State<HomeScreen> {
  final homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listener: (context, state) {
          if (state is HomeLoaded) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case HomeLoading:
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            case HomeInitial:
              {
                return Center(
                  child: Text("Home page"),
                );
              }
            default:
              {
                return SizedBox();
              }
          }
        },
      ),
    );
  }
}
