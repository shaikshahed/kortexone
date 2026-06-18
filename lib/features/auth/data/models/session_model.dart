import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';

part 'session_model.freezed.dart';
part 'session_model.g.dart';

@freezed
abstract class SessionModel with _$SessionModel {
  const factory SessionModel({
    required String user,
    required String name,
    required String role,
    required String department,
    required List<String> permissions,
    @JsonKey(name: 'is_platform_admin') required bool isPlatformAdmin,
    @JsonKey(name: 'user_id') required String userId,
    required String tenant,
    @JsonKey(name: 'tenant_name') required String tenantName,
    @JsonKey(name: 'jwt_token') String? jwtToken,
  }) = _SessionModel;

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  const SessionModel._();

  UserModel toUserModel() {
    return UserModel(
      id: userId,
      email: user,
      name: name,
    );
  }
}
