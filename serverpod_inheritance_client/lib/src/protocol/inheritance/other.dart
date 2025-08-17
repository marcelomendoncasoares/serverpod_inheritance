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

/// An unrelated class with the same fields as the Parent class.
abstract class Other implements _i1.SerializableModel {
  Other._({required this.parent});

  factory Other({required String parent}) = _OtherImpl;

  factory Other.fromJson(Map<String, dynamic> jsonSerialization) {
    return Other(parent: jsonSerialization['parent'] as String);
  }

  /// The parent field.
  String parent;

  /// Returns a shallow copy of this [Other]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Other copyWith({String? parent});
  @override
  Map<String, dynamic> toJson() {
    return {'parent': parent};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _OtherImpl extends Other {
  _OtherImpl({required String parent}) : super._(parent: parent);

  /// Returns a shallow copy of this [Other]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Other copyWith({String? parent}) {
    return Other(parent: parent ?? this.parent);
  }
}
