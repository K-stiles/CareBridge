class AppApi {
  static const String baseURL =
      "https://carebridge-api-exp2.onrender.com/api/v1";

  static const String healthCheck =
      "https://carebridge-api-exp2.onrender.com/ping";

  /// AUTH PATIENT
  static const String patientloginURL = "$baseURL/auth/login";
  static const String patientRegisterURL = "$baseURL/auth/register";

  ///AUTH DOCTOR
  static const String doctorloginURL = "$baseURL/auth/login-doctor";
  static const String doctorRegisterURL = "$baseURL/auth/register-doctor";

  /// PATIENTS
  static const String basePatientsURL = "$baseURL/patients";

  /// DOCTORS
  static const String baseDocotorsURL = "$baseURL/doctors";

  /// LOGOUT
  static const String baseLogoutURL = "$baseURL/auth/logout";

  /// APPOINTMENT
  static const String baseAppointmentURL = "$baseURL/appointments";

  /// OFFERED SERVICES
  static const String baseOfferedServicesUrl = "$baseURL/services";

  /// SPECIALIZATION SERVICES
  static const String baseSpecializationUrl = "$baseURL/specializations";

  /// PRESCRIPTION SERVICES
  static const String basePrescriptionsUrl = "$baseURL/prescriptions";

  /// DRUGS SERVICES
  static const String baseDrugsUrl = "$baseURL/drugs";

  /// MEDICALS SERVICES
  static const String baseMedicalsUrl = "$baseURL/medicalinfo";
}
