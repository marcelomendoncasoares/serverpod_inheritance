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
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'inheritance/grandchild.dart' as _i3;
import 'inheritance/child.dart' as _i4;
import 'greeting.dart' as _i5;
import 'inheritance/container.dart' as _i6;
import 'inheritance/other.dart' as _i7;
import 'inheritance/parent.dart' as _i8;
export 'greeting.dart';
export 'inheritance/child.dart';
export 'inheritance/container.dart';
export 'inheritance/grandchild.dart';
export 'inheritance/other.dart';
export 'inheritance/parent.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    ..._i2.Protocol.targetTableDefinitions
  ];

  static Type? getRuntimeTypeFromJson(dynamic data) {
    if (data is Map) {
      switch (data['__runtimeClassName__']) {
        case 'GrandChild':
          return _i3.GrandChild;
        case 'Child':
          return _i4.Child;
        case 'Greeting':
          return _i5.Greeting;
        case 'Container':
          return _i6.Container;
        case 'Other':
          return _i7.Other;
        case 'Parent':
          return _i8.Parent;
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
    if (runtimeType != null && t == null) {
      return deserialize<T>(data, runtimeType);
    }

    t ??= T;
    if (t == _i3.GrandChild) {
      return _i3.GrandChild.fromJson(data) as T;
    }
    if (t == _i4.Child) {
      return _i4.Child.fromJson(data) as T;
    }
    if (t == _i5.Greeting) {
      return _i5.Greeting.fromJson(data) as T;
    }
    if (t == _i6.Container) {
      return _i6.Container.fromJson(data) as T;
    }
    if (t == _i7.Other) {
      return _i7.Other.fromJson(data) as T;
    }
    if (t == _i8.Parent) {
      return _i8.Parent.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.GrandChild?>()) {
      return (data != null ? _i3.GrandChild.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Child?>()) {
      return (data != null ? _i4.Child.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Greeting?>()) {
      return (data != null ? _i5.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Container?>()) {
      return (data != null ? _i6.Container.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Other?>()) {
      return (data != null ? _i7.Other.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Parent?>()) {
      return (data != null ? _i8.Parent.fromJson(data) : null) as T;
    }
    if (t == List<_i4.Child>) {
      return (data as List).map((e) => deserialize<_i4.Child>(e)).toList() as T;
    }
    if (t == Map<String, _i4.Child>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<_i4.Child>(v))) as T;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    // TODO: Types with inheritance must be sorted from the most derived to the least
    // derived to avoid evaluating correct class.
    switch (data) {
      case _i3.GrandChild():
        return 'GrandChild';
      case _i4.Child():
        return 'Child';
      case _i8.Parent():
        return 'Parent';
      case _i5.Greeting():
        return 'Greeting';
      case _i6.Container():
        return 'Container';
      case _i7.Other():
        return 'Other';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
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
      return deserialize<_i3.GrandChild>(data['data']);
    }
    if (dataClassName == 'Child') {
      return deserialize<_i4.Child>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i5.Greeting>(data['data']);
    }
    if (dataClassName == 'Container') {
      return deserialize<_i6.Container>(data['data']);
    }
    if (dataClassName == 'Other') {
      return deserialize<_i7.Other>(data['data']);
    }
    if (dataClassName == 'Parent') {
      return deserialize<_i8.Parent>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'serverpod_inheritance';
}
