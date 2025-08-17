# Serverpod Polymorphism Fix

This repository is an attempt to fix Serverpod
[issue #2909](https://github.com/serverpod/serverpod/issues/2909), which
highlights the current problems to support polymorphism on endpoints and phase
the inheritance feature out from experimental.

## Proposed solution

Add a `__runtimeClassName__` field on all models to carry the runtime class
information and be used in the `Protocol.deserialize` to redirect the parsing
to the correct model class. This field can be easily added to the `toJson`
method of each model on the code generation:

```dart
  @override
  Map<String, dynamic> toJson() {
    return {
      '__runtimeClassName__': 'Child',
      'parent': parent,
      'child': child,
    };
  }
```

The usage of a custom "hidden" field should also not be a problem, as we do not
check JSONs for extra fields other than the ones present in the class being
deserialized.

To support deserialization of nested models - like the container example
mentioned in the issue -, the `fromJson` of such models must change from
directly calling the `fromJson` of contained classes to instead use the
`Protocol.deserialize` method. Below is an example:

```dart
// file: `serverpod_inheritance_server/lib/src/generated/inheritance/container.dart`

  factory Container.fromJson(Map<String, dynamic> jsonSerialization) {
    return Container(
      child: _i3.Protocol().deserialize<_i2.Child>(jsonSerialization['child']),
      childrenList: _i3.Protocol()
          .deserialize<List<_i2.Child>>(jsonSerialization['childrenList']),
      childrenMap: _i3.Protocol().deserialize<Map<String, _i2.Child>>(
          jsonSerialization['childrenMap']),
    );
  }
```

This is even an improvement, as we reduce duplicated code and concentrate all
decoding on the `Protocol` class.

## Solution implementation

All test cases were added previously on
[this commit](https://github.com/marcelomendoncasoares/serverpod_inheritance/commit/372fc7bce6bbe3e4e8c3c34df7d14297824fffe6),
with tests for both the client and the server.

The solution was implemented separately on
[this other commit](https://github.com/marcelomendoncasoares/serverpod_inheritance/commit/3a328fec65e8f7412a752f54e9080f23da784758)
by simulating which changes on the generated code would be necessary to fix the
issue. If the solution is validated, then the source code of `serverpod_cli`
must be changed to generate the expected code.

## Positive side-effects

By using this solution, the `encodeWithClassName` method would no longer be
necessary, as the class name would be present on all `toJson` serializations.
Thus, this change would also represent a greater simplification to the encoding
and decoding methods in the framework.

## Breaking changes

Previously, classes that looked like (had same fields as) the target class
would be deserialized as the target class. If the fields had same value, it
would work, but would break if fields had different types. As now the class
will be deserialized to its original runtime type, this will no longer work.
See the `Parent`/`Other` example in the tests for more details.

Although this is a breaking change, it seems more of a fix for an edge case
that should not be supported, as it goes against the type-safety of the
framework. So, this change also contributes in making the type-safety stricter
and more coherent with what should happen if there were no serialization
roundtrip between the client and server.
