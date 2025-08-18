import 'package:serverpod_inheritance_server/src/generated/protocol.dart';
import 'package:test/test.dart';

void main() {
  test(
      'Given a Parent object '
      'when serialized '
      'then it produces the JSON with the type key.', () {
    final parent = Parent(
      parent: 'This is a parent',
    );

    final json = parent.toJson();

    expect(json['__runtimeClassName__'], 'Parent');
    expect(json['parent'], 'This is a parent');
  });

  test(
      'Given a Child object '
      'when serialized '
      'then it produces the JSON with the type key.', () {
    final child = Child(
      parent: 'This is a parent',
      child: 'This is a child',
    );

    final json = child.toJson();

    expect(json['__runtimeClassName__'], 'Child');
    expect(json['child'], 'This is a child');
    expect(json['parent'], 'This is a parent');
  });

  test(
      'Given a GrandChild object '
      'when serialized '
      'then it produces the JSON with the type key.', () {
    final grandChild = GrandChild(
      parent: 'This is a parent',
      child: 'This is a child',
      grandchild: 'This is a grandchild',
    );

    final json = grandChild.toJson();

    expect(json['__runtimeClassName__'], 'GrandChild');
    expect(json['grandchild'], 'This is a grandchild');
    expect(json['child'], 'This is a child');
    expect(json['parent'], 'This is a parent');
  });

  test(
      'Given a backwards-compatible Parent JSON without runtimeClassName '
      'when deserialized '
      'then it deserializes as Parent.', () {
    final json = {
      'parent': 'This is a parent',
    };

    final deserialized = Protocol().deserialize<Parent>(json);

    expect(deserialized, isA<Parent>());
    expect(deserialized.parent, 'This is a parent');
  });

  test(
      'Given a backwards-compatible Child JSON without runtimeClassName '
      'when deserialized '
      'then it deserializes as Child.', () {
    final json = {
      'parent': 'This is a parent',
      'child': 'This is a child',
    };

    final deserialized = Protocol().deserialize<Child>(json);

    expect(deserialized, isA<Child>());
    expect(deserialized.parent, 'This is a parent');
    expect(deserialized.child, 'This is a child');
  });

  test(
      'Given a backwards-compatible GrandChild JSON without runtimeClassName '
      'when deserialized '
      'then it deserializes as GrandChild.', () {
    final json = {
      'parent': 'This is a parent',
      'child': 'This is a child',
      'grandchild': 'This is a grandchild',
    };

    final deserialized = Protocol().deserialize<GrandChild>(json);

    expect(deserialized, isA<GrandChild>());
    expect(deserialized.parent, 'This is a parent');
    expect(deserialized.child, 'This is a child');
    expect(deserialized.grandchild, 'This is a grandchild');
  });

  test(
      'Given a Child object '
      'when deserialized as Parent '
      'then it maintains the runtimeType as Child.', () {
    final child = Child(
      parent: 'This is a parent',
      child: 'This is a child',
    );

    final json = child.toJson();
    final deserialized = Protocol().deserialize<Parent>(json);

    expect(deserialized.parent, 'This is a parent');
    expect(deserialized, isA<Child>());
    expect((deserialized as Child).child, 'This is a child');
  });

  test(
      'Given a GrandChild object '
      'when deserialized as Parent '
      'then it maintains the runtimeType as GrandChild.', () {
    final grandChild = GrandChild(
      parent: 'This is a parent',
      child: 'This is a child',
      grandchild: 'This is a grandchild',
    );

    final json = grandChild.toJson();
    final deserialized = Protocol().deserialize<Parent>(json);

    expect(deserialized.parent, 'This is a parent');
    expect(deserialized, isA<GrandChild>());
    expect((deserialized as GrandChild).child, 'This is a child');
    expect(deserialized.grandchild, 'This is a grandchild');
  });

  test(
      'Given a GrandChild object '
      'when deserialized as Child '
      'then it maintains the runtimeType as GrandChild.', () {
    final grandChild = GrandChild(
      parent: 'This is a parent',
      child: 'This is a child',
      grandchild: 'This is a grandchild',
    );

    final json = grandChild.toJson();
    final deserialized = Protocol().deserialize<Child>(json);

    expect(deserialized.child, 'This is a child');
    expect(deserialized, isA<GrandChild>());
    expect((deserialized as GrandChild).grandchild, 'This is a grandchild');
  });

  test(
      'Given a class that holds Child objects in a container '
      'when deserialized '
      'then GrandChild objects maintain their runtime type.', () {
    final container = Container(
      child: GrandChild(
        parent: 'Parent 1',
        child: 'Child 1',
        grandchild: 'GrandChild 1',
      ),
      childrenList: [
        Child(
          parent: 'Parent 2',
          child: 'Child 2',
        ),
        GrandChild(
          parent: 'Parent 3',
          child: 'Child 3',
          grandchild: 'GrandChild 3',
        ),
      ],
      childrenMap: {
        'child4': Child(
          parent: 'Parent 4',
          child: 'Child 4',
        ),
        'child5': GrandChild(
          parent: 'Parent 5',
          child: 'Child 5',
          grandchild: 'GrandChild 5',
        ),
      },
    );

    final json = container.toJson();
    final deserialized = Protocol().deserialize<Container>(json);

    expect(deserialized.child, isA<GrandChild>());
    expect(deserialized.childrenList[0], isA<Child>());
    expect(deserialized.childrenList[0], isNot(isA<GrandChild>()));
    expect(deserialized.childrenList[1], isA<GrandChild>());
    expect(deserialized.childrenMap['child4'], isA<Child>());
    expect(deserialized.childrenMap['child4'], isNot(isA<GrandChild>()));
    expect(deserialized.childrenMap['child5'], isA<GrandChild>());
  });

  // This test would not fail before the changes to support polymorphism. If a class
  // was a subset of other with same types on all common fields, it would deserialize
  // as the other class.
  test(
      'Given an object that has all fields of Parent '
      'when deserialized as Parent then '
      'it raises an exception.', () {
    final other = Other(parent: 'This is not a parent');

    final json = other.toJson();

    expect(
      () => Protocol().deserialize<Parent>(json),
      throwsA(isA<TypeError>()),
    );
  });

  test(
      'Given an unrelated object that does not have Parent fields '
      'when deserialized as Parent '
      'then it raises an exception.', () {
    final greeting = Greeting(
      message: 'Hello, world!',
      author: 'John Doe',
      timestamp: DateTime.now(),
    );

    final json = greeting.toJson();

    expect(
      () => Protocol().deserialize<Parent>(json),
      throwsA(isA<TypeError>()),
    );
  });
}
