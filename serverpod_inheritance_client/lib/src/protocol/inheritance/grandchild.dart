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
import '../protocol.dart' as _i1;
import 'package:serverpod_client/serverpod_client.dart' as _i2;

/// A grandchild class.
abstract class GrandChild extends _i1.Child implements _i2.SerializableModel {
  GrandChild._({
    required super.parent,
    required super.child,
    required this.grandchild,
  });

  factory GrandChild({
    required String parent,
    required String child,
    required String grandchild,
  }) = _GrandChildImpl;

  factory GrandChild.fromJson(Map<String, dynamic> jsonSerialization) {
    return GrandChild(
      parent: jsonSerialization['parent'] as String,
      child: jsonSerialization['child'] as String,
      grandchild: jsonSerialization['grandchild'] as String,
    );
  }

  /// The grandchild field.
  String grandchild;

  /// Returns a shallow copy of this [GrandChild]
  /// with some or all fields replaced by the given arguments.
  @override
  @_i2.useResult
  GrandChild copyWith({
    String? parent,
    String? child,
    String? grandchild,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'parent': parent,
      'child': child,
      'grandchild': grandchild,
    };
  }

  @override
  String toString() {
    return _i2.SerializationManager.encode(this);
  }
}

class _GrandChildImpl extends GrandChild {
  _GrandChildImpl({
    required String parent,
    required String child,
    required String grandchild,
  }) : super._(
          parent: parent,
          child: child,
          grandchild: grandchild,
        );

  /// Returns a shallow copy of this [GrandChild]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  @override
  GrandChild copyWith({
    String? parent,
    String? child,
    String? grandchild,
  }) {
    return GrandChild(
      parent: parent ?? this.parent,
      child: child ?? this.child,
      grandchild: grandchild ?? this.grandchild,
    );
  }
}
