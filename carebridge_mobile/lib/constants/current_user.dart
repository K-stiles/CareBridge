class UserInfo {
  String id = '';
  String name = '';

  UserInfo({required this.id, required this.name});

  bool get isEmpty => id.isEmpty;

  UserInfo.empty();
}

UserInfo currentUser = UserInfo.empty();
