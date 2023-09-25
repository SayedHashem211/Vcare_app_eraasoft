import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:v_care_app/core/utils/components.dart';
import 'package:v_care_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:v_care_app/features/home/presentation/views/widgets/booking_successfully.dart';
import 'package:v_care_app/features/home/presentation/views/widgets/choose_time_widget.dart';

import '../../../../core/utils/custom_button.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({
    required this.doctorId,
    Key? key}) : super(key: key);

  final dynamic doctorId;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final dateController = TextEditingController();
  var formBookingKey = GlobalKey<FormState>();

  String? time;
  int indexTime = 0;
  final List<String> availableTimes = [
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
  ];

  late HomeCubit cubit;

  @override
  void initState() {
   cubit = HomeCubit.get(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Select date",
              style: GoogleFonts.roboto(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                  controller: dateController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    //labelText: "Enter Date"
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      //print(pickedDate);
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      //print(formattedDate);
                      setState(() {
                        dateController.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      //print("Date is not selected");
                    }
                  }),
            ),
            SizedBox(height: 20.h,),
            Text(
              "Select time",
              style: GoogleFonts.roboto(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 30.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: availableTimes.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      time = availableTimes[index];
                      indexTime = index;
                      cubit.changeColor(index);
                    },
                    child: ChooseTimeWidget(
                      time: availableTimes[index],
                      index: index,
                    ),
                  )),
            ),
            SizedBox(height: 20.h,),
            BlocConsumer<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is BookingLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  );
                } else {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 45.h,
                    child: CustomButton(
                      text: 'Book an appointment',
                      onTap: () async {
                        print(dateController.text);
                        print(time);
                        if (dateController.text == null || time == null) {
                          const SnackBar(
                            content: Text('Date And Time Required!'),
                            duration: Duration(seconds: 1),
                            showCloseIcon: true,
                          );
                        } else {
                          cubit.bookAppointment(
                              doctorId: widget.doctorId.toString(),
                              startTime: "${dateController.text} $time"
                          );
                        }
                      },
                    ),
                  );
                }
              },
              listener: (context, state) {
                if (state is BookingErrorState) {
                  const SnackBar(
                    content: Text('Something went wrong!'),
                    duration: Duration(seconds: 1),
                    showCloseIcon: true,
                  );
                } else if (state is BookingSuccessState) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const BookingSuccessfullyScreen();
                  }));
                  dateController.clear();
                  dateController.text = "" ;
                  time = null;
                  cubit.isChoose[indexTime] = false;
                }
              },
            )
          ],
        ),
      ),
    );
  }
}



