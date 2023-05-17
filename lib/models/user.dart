import 'package:get/get.dart';

class User extends GetxController {
  var success;
  var message;
  var details;
  var id;
  var name;
  var email;
  var password;
  var phone;
  var address;
  var image;
  var device_type;
  var login_type;
  var latitude;
  var longitude;
  var reg_id;
  var EmailOtp;
  var created;
  var updated;
  var Fresh_count = 0.obs;
  var Pending_count = 0.obs;
  var History_count = 0.obs;
  var hq_id;
  var lan_line;
  var policeStation_Name;
  var SHO_name;
  var policeStationId;
  var assignId;
  var status;
  var report;

  var driverId;
  var userId;
  var doctor_id;
  var patient_no;
  var username;

  var releation;
  var selectedHospitalId;
  var hospitalId;
  var firestationheadquaterId;
  var patient_details;
  var patient_address;
  var total_price;

  var User_image;
  var case_type;
  var doctor_request_status;
  var payment_status;
  var driver_name;
  var ambulance_number;
  var police_headquarter_name;

  var hospitalName;

  var patientDetailsByPoliceSta = [].obs;
}
