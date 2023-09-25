
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v_care_app/features/home/presentation/views/widgets/profile_tile.dart';
import '../cubit/home_cubit.dart';

class PatientProfileTab extends StatefulWidget {
  const PatientProfileTab({Key? key}) : super(key: key);

  @override
  State<PatientProfileTab> createState() => _PatientProfileTabState();
}

class _PatientProfileTabState extends State<PatientProfileTab> {
  late HomeCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=HomeCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29.0),
            child: Column(
              children: [
                const Image(image: AssetImage('assets/images/person.png')),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                Text(cubit.patientProfileModel?.data?[0].name ?? "", style: TextStyle(
                  fontSize: 24.sp,
                  color: const Color(0xff030E19),
                ),),
                SizedBox(height: MediaQuery.of(context).size.height*0.005,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Edit account details', style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400
                    ),),
                    SizedBox(width: MediaQuery.of(context).size.width*0.005,),
                    const Image(image: AssetImage('assets/images/edit.png'),width: 18,)
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                Divider(
                  height: 2.h,
                  color: Colors.grey.shade900,
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(image: const AssetImage('assets/images/mail.png',),width: MediaQuery.of(context).size.width*0.1),
                    SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                    Text(cubit.patientProfileModel?.data?[0].email ?? "",style: TextStyle(
                      color: const Color(0xff030E19),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),),
                  ],
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(image: const AssetImage('assets/images/call.png',),width: MediaQuery.of(context).size.width*0.1),
                    SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                    Text(cubit.patientProfileModel?.data?[0].phone ?? "",style: TextStyle(
                      color: const Color(0xff030E19),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(image: const AssetImage('assets/images/lock.png',),width: MediaQuery.of(context).size.width*0.1),
                    SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                    Text('•••••••••••',style: TextStyle(
                      color: const Color(0xff030E19),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),),

                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('History', style: TextStyle(
                      fontSize: 22,
                      color: Color(0xff030E19),
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.black,
                      decorationThickness: 2.0,
                    ),),

                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>  ProfileTile(data: cubit.appointmentsData[index],),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 1.h,),
                    itemCount: cubit.appointmentsData.length)
              ],
            ),
          )
        ],
      );
  },
),
    );
  }
}