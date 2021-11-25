
import 'package:dnews/view_models/main_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MainVM());

  }
}