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
import '../inheritance/child.dart' as _i2;

/// A class that holds child objects.
abstract class Container implements _i1.SerializableModel {
  Container._({
    required this.child,
    required this.childrenList,
    required this.childrenMap,
  });

  factory Container({
    required _i2.Child child,
    required List<_i2.Child> childrenList,
    required Map<String, _i2.Child> childrenMap,
  }) = _ContainerImpl;

  factory Container.fromJson(Map<String, dynamic> jsonSerialization) {
    return Container(
      child: _i2.Child.fromJson(
          (jsonSerialization['child'] as Map<String, dynamic>)),
      childrenList: (jsonSerialization['childrenList'] as List)
          .map((e) => _i2.Child.fromJson((e as Map<String, dynamic>)))
          .toList(),
      childrenMap:
          (jsonSerialization['childrenMap'] as Map).map((k, v) => MapEntry(
                k as String,
                _i2.Child.fromJson((v as Map<String, dynamic>)),
              )),
    );
  }

  /// Direct contained child.
  _i2.Child child;

  /// List of children.
  List<_i2.Child> childrenList;

  /// Map of children.
  Map<String, _i2.Child> childrenMap;

  /// Returns a shallow copy of this [Container]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Container copyWith({
    _i2.Child? child,
    List<_i2.Child>? childrenList,
    Map<String, _i2.Child>? childrenMap,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'child': child.toJson(),
      'childrenList': childrenList.toJson(valueToJson: (v) => v.toJson()),
      'childrenMap': childrenMap.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ContainerImpl extends Container {
  _ContainerImpl({
    required _i2.Child child,
    required List<_i2.Child> childrenList,
    required Map<String, _i2.Child> childrenMap,
  }) : super._(
          child: child,
          childrenList: childrenList,
          childrenMap: childrenMap,
        );

  /// Returns a shallow copy of this [Container]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Container copyWith({
    _i2.Child? child,
    List<_i2.Child>? childrenList,
    Map<String, _i2.Child>? childrenMap,
  }) {
    return Container(
      child: child ?? this.child.copyWith(),
      childrenList:
          childrenList ?? this.childrenList.map((e0) => e0.copyWith()).toList(),
      childrenMap: childrenMap ??
          this.childrenMap.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0.copyWith(),
                  )),
    );
  }
}
