part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

// Logout
class LogoutLoadingState extends HomeState{}
class LogoutSuccessState extends HomeState{}
class LogoutErrorState extends HomeState{}

// bottom_navy_bar

class ChangeBotNavState extends HomeState {}
class ChangeBottomNavState extends HomeState {}


// get all doctors
class GetAllDoctorsLoadingState extends HomeState{}
class GetAllDoctorsSuccessState extends HomeState{}
class GetAllDoctorsErrorState extends HomeState{}




// get patient profile data
class GetPatientProfileDataLoadingState extends HomeState{}
class GetPatientProfileDataSuccessState extends HomeState{}
class GetPatientProfileDataErrorState extends HomeState{}



// get doctor profile data
class GetDoctorProfileDataLoadingState extends HomeState{}
class GetDoctorProfileDataSuccessState extends HomeState{}
class GetDoctorProfileDataErrorState extends HomeState{}


// get home data
class GetHomeDataLoadingState extends HomeState{}
class GetHomeDataSuccessState extends HomeState{}
class GetHomeDataErrorState extends HomeState{}





//get appointment accountScreen
class GetAllAppointmentsLoadingState extends HomeState {}
class GetAllAppointmentsSuccessState extends HomeState {}
class GetAllAppointmentsErrorState extends HomeState {}



// book an appointment
class ChangeTimeWidgetColorState extends HomeState {}
class BookingLoadingState extends HomeState {}
class BookingSuccessState extends HomeState {}
class BookingErrorState extends HomeState {}
