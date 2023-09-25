import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingSuccessfullyScreen extends StatelessWidget {
  const BookingSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pop(context);
    });

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/correct.gif',
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 12),
              Text(
                'Appointment Booked',
                style: GoogleFonts.roboto().copyWith(
                  color: const Color.fromRGBO(3, 14, 25, 0.70),
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}