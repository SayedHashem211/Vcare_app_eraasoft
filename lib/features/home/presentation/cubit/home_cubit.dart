import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:v_care_app/features/home/data/models/doctor_profie_model.dart';
import 'package:v_care_app/features/home/data/models/get_all_doctors_model.dart';

import '../../../../core/networking/remote/DioHelper.dart';
import '../../../../core/networking/remote/endpoints.dart';
import '../../data/models/booking_model.dart';
import '../../data/models/get_all_appointments_model.dart';
import '../../data/models/get_home_data_model.dart';
import '../../data/models/logout_model.dart';
import '../../data/models/patient_profile_model.dart';
import '../views/account_tab.dart';
import '../views/doctors_tab.dart';
import '../views/history_tab.dart';
import '../views/home_tab.dart';
import '../views/search_tab.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  // 1. Logout
  LogoutModel? logoutModel;
  logout() {
    emit(LogoutLoadingState());
    DioHelper.PostData(url: logoutUrl)
        .then((value) {
      logoutModel = LogoutModel.fromJson(value.data);
      print(value.data);
      emit(LogoutSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LogoutErrorState());
    });
  }


   // 2. bottom navy bar
  int currentIndex = 0;

  IconData icon = Icons.visibility_off;
  bool isVisible = false;

  void visible() {
    isVisible = !isVisible;
    icon = isVisible ? Icons.visibility : Icons.visibility_off;
    emit(ChangeBottomNavState());
  }

  List<Widget> screens = [
    const HomeTab(),
    const DoctorsTab(),
    const SearchTab(),
    const HistoryTab(),
    const PatientProfileTab()
  ];

  void changeBot(index, context) {
    emit(ChangeBotNavState());
    currentIndex = index;
    if (currentIndex == 1) {
      getAllDoctors();
    }
    if (currentIndex == 0) {
       getHomeData();
    }
    if (currentIndex == 3) {
      getAllAppointments();
    }
    if (currentIndex == 4) {
      getPatientProfileData();
      getAllAppointments();
    }
  }

  // 3. get all doctors

  GetAllDoctorsModel? getAllDoctorsModel;
  void getAllDoctors()async{
    emit(GetAllDoctorsLoadingState());
    await DioHelper.getData(url: getAllDoctorsUrl).then((value){
     // print(value.data);
         getAllDoctorsModel = GetAllDoctorsModel.fromJson(value.data);
         emit(GetAllDoctorsSuccessState());
    }).catchError((error) {
      //print(error.toString());
      emit(GetAllDoctorsErrorState());
    });

  }

  // 3. get home data

  GetHomeDataModel? getHomeDataModel;
  void getHomeData()async{
    emit(GetHomeDataLoadingState());
    await DioHelper.getData(url: getHomeDataUrl).then((value){
      //print(value.data);
      getHomeDataModel = GetHomeDataModel.fromJson(value.data);
      emit(GetHomeDataSuccessState());
    }).catchError((error) {
     // print(error.toString());
      emit(GetHomeDataErrorState());
    });

  }


  // 5. get all appointments

  GetAllAppointmentsModel? getAllAppointmentsModel;
  List<AppointmentsData> appointmentsData=[];

  void getAllAppointments() {
    emit(GetAllAppointmentsLoadingState());
    DioHelper.getData(url:getAllAppointmentsUrl).then((value) {

      getAllAppointmentsModel = GetAllAppointmentsModel.fromJson(value.data);
      for(var element in value.data['data']){
        appointmentsData.add(AppointmentsData.fromJson(element));
      }
      //print(loginModel?.data?.token);
      //print(loginModel?.data?.id);
      //print(appointmentsData);
      emit(GetAllAppointmentsSuccessState());
    }).catchError((error) {
      //print(error.toString());
      emit(GetAllAppointmentsErrorState());
    });
  }


  // book appointment

  List<bool> isChoose = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];


  void changeColor(int index) {
    emit(ChangeTimeWidgetColorState());
    for (var i = 0; i < isChoose.length; i++) {
      i == index ? isChoose[i] = true : isChoose[i] = false;
    }
    emit(ChangeTimeWidgetColorState());
  }

  BookingModel? bookingModel;
  void bookAppointment({
    required String doctorId,
    required String startTime,
  }) {
    emit(BookingLoadingState());
    DioHelper.PostData(url: bookAppointmentUrl, data: {
      'doctor_id' : doctorId,
      'start_time': startTime,
    }).then((value) {
      bookingModel = BookingModel.fromJson(value.data);
      //print(loginModel?.token);
      //print(loginModel?.data?.id);
      //print(value.data);
      emit(BookingSuccessState());
    }).catchError((error) {
      //print(error.toString());
      emit(BookingErrorState());
    });
  }


// 4. get patient profile data

PatientProfileModel? patientProfileModel;
void getPatientProfileData()async{
  emit(GetPatientProfileDataLoadingState());
  await DioHelper.getData(url: getPatientProfileDataUrl).then((value){
    //print(value.data);
    patientProfileModel = PatientProfileModel.fromJson(value.data);
    emit(GetPatientProfileDataSuccessState());
  }).catchError((error) {
    //print(error.toString());
    emit(GetPatientProfileDataErrorState());
  });

}



// // 4. get doctor profile data
  //
  // GetDoctorProfileDataModel? getDoctorProfileDataModel;
  // void getDoctorProfileData(id)async{
  //   emit(GetDoctorProfileDataLoadingState());
  //   await DioHelper.getData(url: "$getDoctorProfileDataUrl" + "$id").then((value){
  //     print(value.data);
  //     getDoctorProfileDataModel = GetDoctorProfileDataModel.fromJson(value.data);
  //     emit(GetDoctorProfileDataSuccessState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(GetDoctorProfileDataErrorState());
  //   });
  //
  // }
}
