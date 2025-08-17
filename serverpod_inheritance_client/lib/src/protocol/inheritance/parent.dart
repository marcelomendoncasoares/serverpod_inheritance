/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

/// A parent class.
class Parent implements _i1.SerializableModel {
  Parent({required this.parent});

  factory Parent.fromJson(Map<String, dynamic> jsonSerialization) {
    return Parent(parent: jsonSerialization['parent'] as String);
  }

  /// The parent field.
  String parent;

  /// Returns a shallow copy of this [Parent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Parent copyWith({String? parent}) {
    return Parent(parent: parent ?? this.parent);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'__runtimeClassName__': 'Parent', 'parent': parent};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}
