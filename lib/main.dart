import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_agricultural_green_house/core/constants/strings.dart';
import 'package:smart_agricultural_green_house/core/utils/app_router/app_router.dart';
import 'package:smart_agricultural_green_house/features/admin_green_house/persentation/view/widgets/admin_green_house_body.dart';
import 'package:smart_agricultural_green_house/features/change_password/persentation/view/change_password_view.dart';
import 'package:smart_agricultural_green_house/features/edit_profile/persentation/view/edit_profile_view.dart';
import 'package:smart_agricultural_green_house/features/forgot_password/persentation/view/forgot_password_view.dart';
import 'package:smart_agricultural_green_house/features/login/persentation/view/login_view.dart';
import 'package:smart_agricultural_green_house/features/on_boarding/persentation/view/on_boarding_view.dart';
import 'package:smart_agricultural_green_house/features/otp/persentation/view/otp_view.dart';
import 'package:smart_agricultural_green_house/features/otp/persentation/view_model/manger/otp_cubit/otp_cubit.dart';
import 'package:smart_agricultural_green_house/features/profile_page/persentation/view/profile_page_view.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute:logInScreen ,
    );
  }
}
