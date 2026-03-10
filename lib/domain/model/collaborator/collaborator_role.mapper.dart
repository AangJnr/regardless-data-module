// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'collaborator_role.dart';

class CollaboratorRoleMapper extends EnumMapper<CollaboratorRole> {
  CollaboratorRoleMapper._();

  static CollaboratorRoleMapper? _instance;
  static CollaboratorRoleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CollaboratorRoleMapper._());
    }
    return _instance!;
  }

  static CollaboratorRole fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  CollaboratorRole decode(dynamic value) {
    switch (value) {
      case r'admin':
        return CollaboratorRole.admin;
      case r'manager':
        return CollaboratorRole.manager;
      case r'staff':
        return CollaboratorRole.staff;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(CollaboratorRole self) {
    switch (self) {
      case CollaboratorRole.admin:
        return r'admin';
      case CollaboratorRole.manager:
        return r'manager';
      case CollaboratorRole.staff:
        return r'staff';
    }
  }
}

extension CollaboratorRoleMapperExtension on CollaboratorRole {
  String toValue() {
    CollaboratorRoleMapper.ensureInitialized();
    return MapperContainer.globals.toValue<CollaboratorRole>(this) as String;
  }
}
