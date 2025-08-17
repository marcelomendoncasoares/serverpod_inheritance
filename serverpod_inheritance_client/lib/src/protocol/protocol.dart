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
import 'inheritance/grandchild.dart' as _i2;
import 'inheritance/child.dart' as _i3;
import 'greeting.dart' as _i4;
import 'inheritance/container.dart' as _i5;
import 'inheritance/other.dart' as _i6;
import 'inheritance/parent.dart' as _i7;
export 'greeting.dart';
export 'inheritance/child.dart';
export 'inheritance/container.dart';
export 'inheritance/grandchild.dart';
export 'inheritance/other.dart';
export 'inheritance/parent.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static Type? getRuntimeTypeFromJson(dynamic data) {
    if (data is Map) {
      switch (data['__runtimeClassName__']) {
        case 'GrandChild':
          return _i2.GrandChild;
        case 'Child':
          return _i3.Child;
        case 'Greeting':
          return _i4.Greeting;
        case 'Container':
          return _i5.Container;
        case 'Other':
          return _i6.Other;
        case 'Parent':
          return _i7.Parent;
      }
    }
    return null;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    // TODO: Route the deserialization for the subtype.
    final runtimeType = getRuntimeTypeFromJson(data);
    if (runtimeType != null && runtimeType != T && t == null) {
      return deserialize<T>(data, runtimeType);
    }

    t ??= T;
    if (t == _i2.GrandChild) {
      return _i2.GrandChild.fromJson(data) as T;
    }
    if (t == _i3.Child) {
      return _i3.Child.fromJson(data) as T;
    }
    if (t == _i4.Greeting) {
      return _i4.Greeting.fromJson(data) as T;
    }
    if (t == _i5.Container) {
      return _i5.Container.fromJson(data) as T;
    }
    if (t == _i6.Other) {
      return _i6.Other.fromJson(data) as T;
    }
    if (t == _i7.Parent) {
      return _i7.Parent.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.GrandChild?>()) {
      return (data != null ? _i2.GrandChild.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Child?>()) {
      return (data != null ? _i3.Child.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Greeting?>()) {
      return (data != null ? _i4.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Container?>()) {
      return (data != null ? _i5.Container.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Other?>()) {
      return (data != null ? _i6.Other.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Parent?>()) {
      return (data != null ? _i7.Parent.fromJson(data) : null) as T;
    }
    if (t == List<_i3.Child>) {
      return (data as List).map((e) => deserialize<_i3.Child>(e)).toList() as T;
    }
    if (t == Map<String, _i3.Child>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<_i3.Child>(v))) as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    // TODO: Types with inheritance must be sorted from the most derived to the least
    // derived to avoid evaluating correct class.
    switch (data) {
      case _i2.GrandChild():
        return 'GrandChild';
      case _i3.Child():
        return 'Child';
      case _i7.Parent():
        return 'Parent';
      case _i4.Greeting():
        return 'Greeting';
      case _i5.Container():
        return 'Container';
      case _i6.Other():
        return 'Other';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    // TODO: Either add the always present '__runtimeClassName__' field support here
    // or remove this alternative serialization/deserialization engine, since the
    // default would now carry the class name information.
    var dataClassName = data['className'] ?? data['__runtimeClassName__'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'GrandChild') {
      return deserialize<_i2.GrandChild>(data['data']);
    }
    if (dataClassName == 'Child') {
      return deserialize<_i3.Child>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i4.Greeting>(data['data']);
    }
    if (dataClassName == 'Container') {
      return deserialize<_i5.Container>(data['data']);
    }
    if (dataClassName == 'Other') {
      return deserialize<_i6.Other>(data['data']);
    }
    if (dataClassName == 'Parent') {
      return deserialize<_i7.Parent>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
