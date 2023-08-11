import 'package:dental_news/Main_Bottom.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  final String verificationId;

  OTPScreen({required this.phoneNumber, required this.verificationId});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                height: height * 0.2,
                width: width * 0.45,
                child: Image.asset(
                  'image/APP.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                child: const Text(
                  'DENTAL NEWS OTP',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    height: 1.2125,
                    color: Color(0xff38023d),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0x7cffffff),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xFF46026D),
                        ),
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                width * 0.05,
                                height * 0.06,
                                width * 0.02,
                                height * 0.008,
                              ),
                              child: Text(
                                'รหัส OTP',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF46026D),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 10, 20, 8),
                              child: TextFormField(
                                controller: otpController,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: const Color(0xFF46026D),
                                  ),
                                  hintText: 'ระบุรหัส OTP',
                                  hintStyle: TextStyle(
                                    color: const Color(0xFF46026D),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  String otpCode = otpController.text;
                                  // Perform your OTP verification logic here
                                  // Example: Verify the OTP code entered by the user
                                  // If verified successfully, navigate to the home screen
                                  // Otherwise, show an error message
                                  if (otpCode == '123456') {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Home(),
                                      ),
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('เกิดข้อผิดพลาด'),
                                          content: Text('รหัส OTP ไม่ถูกต้อง'),
                                          actions: [
                                            TextButton(
                                              child: Text('ตกลง'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 10,
                                  ),
                                  backgroundColor: const Color(0xFF56078B),
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2125,
                                  ),
                                ),
                                child: const Text('ยืนยัน'),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
