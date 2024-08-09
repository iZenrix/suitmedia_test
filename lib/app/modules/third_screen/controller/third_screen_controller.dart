import 'package:get/get.dart';
import 'package:suitmedia_test/app/modules/third_screen/repository/third_screen_repository.dart';
import 'package:suitmedia_test/app/modules/third_screen/model/user_model.dart';

class ThirdScreenController extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;
  RxInt selectedIndex = 0.obs;
  RxString selectedName = 'Selected User Name'.obs;

  final UserRepository repository;

  ThirdScreenController({required this.repository});

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var fetchedUsers = await repository.getUsers();
      users.assignAll(fetchedUsers);
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
