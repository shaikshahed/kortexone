// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionModel _$SessionModelFromJson(Map<String, dynamic> json) =>
    _SessionModel(
      user: json['user'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      department: json['department'] as String,
      permissions: (json['permissions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isPlatformAdmin: json['is_platform_admin'] as bool,
      userId: json['user_id'] as String,
      tenant: json['tenant'] as String,
      tenantName: json['tenant_name'] as String,
      jwtToken: json['jwt_token'] as String?,
    );

Map<String, dynamic> _$SessionModelToJson(_SessionModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'name': instance.name,
      'role': instance.role,
      'department': instance.department,
      'permissions': instance.permissions,
      'is_platform_admin': instance.isPlatformAdmin,
      'user_id': instance.userId,
      'tenant': instance.tenant,
      'tenant_name': instance.tenantName,
      'jwt_token': instance.jwtToken,
    };
