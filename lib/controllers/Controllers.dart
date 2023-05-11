import 'package:get/get.dart';

import '../models/user.dart';


class Controllers {
  User userPutData = Get.put(User());
  User userFetchData = Get.find();
}
