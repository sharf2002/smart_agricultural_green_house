import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smart_agricultural_green_house/core/utils/customButtoms.dart';
import 'package:smart_agricultural_green_house/features/create_account/persentation/view/creat_account_view.dart';

import '../../../../../core/constants/strings.dart';
import '../../../../create_user/persentation/view/create_user_view.dart';
import '../../view_model/manger/otp_cubit/otp_cubit.dart';

class OtpBody extends StatefulWidget {
  OtpBody({Key? key, required this.phoneNumber}) : super(key: key);
  final phoneNumber;

  @override
  State<OtpBody> createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> {
  late String otpCode;

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ), // CircularProgressIndicator
      ), // Center
    ); // AlertDialog
    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  Widget _buildPhoneVerificationBloc() {
    return BlocListener<OtpCubit, OtpState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is Loading) {
          return showProgressIndicator(context);
        }
        if (state is PhoneOtpVerified) {
          Navigator.pop(context);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return CreateUserView();
              },
            ),
          );
        }
        if (state is ErrorOccurred) {
          Navigator.pop(context);
          String errorMessage = (state).errorMessage;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.black,
              duration: Duration(seconds: 3),
            ),
          );
        } // SnackBar
      },
      child: Container(),
    );
  }
  void _login(BuildContext context){
    BlocProvider.of<OtpCubit>(context).submitOtp(otpCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Text(
                'verify your phone Number',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: RichText(
                text: TextSpan(
                  text: 'Enter your 6 digits code number sent to you at',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      text: ' ${widget.phoneNumber}',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Container(
                child: PinCodeTextField(
                  length: 6,
                  autoFocus: true,
                  obscureText: false,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      borderWidth: 1,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.white,
                  enableActiveFill: true,
                  onCompleted: (code) {
                    otpCode = code;
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                  },
                  appContext: context,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: CustomButton(
                  onPressed: () {
                    showProgressIndicator(context);
                    _login(context);
                  },
                  text: Text(
                    'Verify',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,
                  width: 60,
                  height: 40,
                  radius: 5,
                ),
              ),
            ),
            _buildPhoneVerificationBloc(),
          ],
        ),
      ),
    );
  }
}
