import 'package:flutter/material.dart';

import '../models/user_error.dart';
import '../models/users_list_model.dart';
import '../repo/api_status.dart';
import '../repo/user_services.dart';

class UserViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError? _userError;
  UserModel? _selectedModel;

  UserModel _addingUser = UserModel();

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError? get userError => _userError;
  UserModel? get selectedModel => _selectedModel;
  UserModel get addingUser => _addingUser;

  UserViewModel() {
    getUsers();
  }
  setSelectedUser(UserModel userModel) {
    _selectedModel = userModel;
  }

  setLoading(bool laoding) {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse!,
      );
      setUserError(userError);
    }
    setLoading(false);
  }

  addUser() async {
    if (!isValid()) {
      return;
    }
    _userListModel.add(addingUser);
    _addingUser = UserModel();
    notifyListeners();
    return true;
  }

  isValid() {
    if (addingUser.name == null || addingUser.name!.isEmpty) {
      return false;
    }
    if (addingUser.email == null || addingUser.name!.isEmpty) {
      return false;
    }
    return true;
  }
}
