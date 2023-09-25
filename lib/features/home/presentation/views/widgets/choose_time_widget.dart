import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v_care_app/features/home/presentation/cubit/home_cubit.dart';


class ChooseTimeWidget extends StatefulWidget {
  const ChooseTimeWidget({super.key, required this.time, required this.index});
  final String time;
  final int index;

  @override
  State<ChooseTimeWidget> createState() => _ChooseTimeWidgetState();
}

class _ChooseTimeWidgetState extends State<ChooseTimeWidget> {
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          margin: EdgeInsets.symmetric(horizontal: 6.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: cubit.isChoose[widget.index] == true
                  ? const Color(0xff174068)
                  : const Color(0xffDBE2E3)
            //   color: const Color(0xff174068)
          ),
          child: Center(
            child: Text(
              widget.time,
              style: GoogleFonts.roboto().copyWith(
                //color: Colors.white,
                  color: cubit.isChoose[widget.index] == true
                      ?  Colors.white
                      : Colors.grey.shade600,
                  //    color: Colors.grey.shade600,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
        );
      },
    );
  }
}