import 'package:dart_mappable/dart_mappable.dart';

part 'collaborator_role.mapper.dart';

@MappableEnum(caseStyle: CaseStyle.upperCase)
enum CollaboratorRole { admin, manager, staff }
