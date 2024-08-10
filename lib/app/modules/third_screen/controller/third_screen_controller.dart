import 'package:get/get.dart';
import 'package:suitmedia_test/app/modules/third_screen/repository/third_screen_repository.dart';
import 'package:suitmedia_test/app/modules/third_screen/model/user_model.dart';

class ThirdScreenController extends GetxController {
  var users = <User>[].obs;
  RxBool isLoading = true.obs;
  RxBool isLoadingMore = false.obs;
  RxInt currentPage = 1.obs;
  RxInt totalPages = 2.obs;
  RxInt selectedIndex = 0.obs;
  RxString selectedName = 'Selected User Name'.obs;

  final UserRepository repository;

  ThirdScreenController({required this.repository});

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        currentPage.value = 1;
        users.clear();
      } else {
        isLoadingMore(true);
      }

      isLoading(true);

      var fetchedUsers = await repository.getUsers(
        page: currentPage.value,
        perPage: 8,
      );
      users.addAll(fetchedUsers);

      if (fetchedUsers.isNotEmpty) {
        currentPage.value++;
      }

      if (isRefresh) {
        final jsonData = await repository.getUsers(page: currentPage.value);
        totalPages.value = jsonData.length;
      }

    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
      isLoadingMore(false);
    }
  }


  Future<void> refreshUsers() async {
    fetchUsers(isRefresh: true);
  }

  void loadMoreUsers() {
    if (currentPage.value <= totalPages.value && !isLoadingMore.value) {
      fetchUsers();
    }
  }
}
