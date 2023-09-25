import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:v_care_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:v_care_app/features/home/presentation/views/widgets/profile_tile.dart';


class HistoryTab extends StatefulWidget {
  const HistoryTab({Key? key}) : super(key: key);

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return cubit.getAllAppointmentsModel?.data?.isEmpty ?? true ?
             Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SizedBox(height: 20.h,),
                 Text("               No Appointments Yet!", style: TextStyle(
                   color: Colors.black,
                   fontSize: 20.sp,
                   fontWeight: FontWeight.w700,
                 ),
                 textAlign: TextAlign.center,
                 ),
               ],
             )
            :
            Column(
              children: [
                SizedBox(height: 20.h,),
                Text("All Appointments",style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ), ),
                SizedBox(height: 8.h,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          ProfileTile(data: cubit.appointmentsData[index],),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 1.h,),
                      itemCount: cubit.appointmentsData.length),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
