import 'package:flutter/material.dart';
import 'package:smart_agricultural_green_house/features/otp/persentation/view/widgets/otp_body.dart';

class OtpView extends StatelessWidget {
  const OtpView({Key? key, required this.phoneNumber}) : super(key: key);
final phoneNumber;
  @override
  Widget build(BuildContext context) {
    return OtpBody(phoneNumber : phoneNumber);
  }
}
