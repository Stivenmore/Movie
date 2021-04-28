import 'package:flutter/material.dart';
import 'package:movies/domain/cubit/movie_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/pages/dashboard/Dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final cubit = context.read<MovieCubit>();
    super.initState();
    cubit.getDataApi(1).whenComplete(() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: size.height,
          width: size.width,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/logo_splash.jpg',
                ),
                const SizedBox(
                  height: 40,
                ),
                CircularProgressIndicator(
                  backgroundColor: Color(0xffE04536),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
