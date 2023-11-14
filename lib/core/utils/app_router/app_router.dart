import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_agricultural_green_house/core/constants/strings.dart';
import 'package:smart_agricultural_green_house/features/create_account/persentation/view/creat_account_view.dart';
import 'package:smart_agricultural_green_house/features/login/persentation/view/login_view.dart';
import 'package:smart_agricultural_green_house/features/otp/persentation/view/otp_view.dart';
import 'package:smart_agricultural_green_house/features/otp/persentation/view_model/manger/otp_cubit/otp_cubit.dart';

class AppRouter {
  OtpCubit? otpCubit;
  AppRouter(){
      otpCubit = OtpCubit();
}

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case logInScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<OtpCubit>.value(
            value: otpCubit!,
            child: LoginView(),
          ), // BlocProvider
        );
      case createAccountScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<OtpCubit>.value(
            value: otpCubit!,
            child: CreateAccountView(),
          ), // BlocProvider
        );

      case otpScreen :
        final phoneNumber = settings.arguments ;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<OtpCubit>.value(
            value: otpCubit!,
            child: OtpView(phoneNumber : phoneNumber),
          ), // BlocProvider
        );// MaterialPageRoute
    }
  }
} // MaterialPageRoute
