abstract class EndPoint {
  static const String baseUrl = 'https://vcare.integration25.com/api/';
  static const String login = 'auth/login';
  static const String register = 'auth/register';
  static const String logout = 'auth/logout';
  static const String specialization = 'specialization/index';
  static const String storeAppointment = 'appointment/store';
  static const String getAllAppointment = 'appointment/index';
  static const String profile = 'user/profile';
  static String search(String doctorName) => 'doctor/doctor-search?name=$doctorName';
}
