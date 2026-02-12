import 'package:share_plus/share_plus.dart';

class UserModel {
  final String? name;
  final String? email;
  final String? nickName;
  final XFile? picture;

  UserModel({
    required this.name,
    required this.email,
    required this.nickName,
    required this.picture,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? nickName,
    XFile? picture,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      nickName: nickName ?? this.nickName,
      picture: picture ?? XFile(this.picture!.path),
    );
  }
}
