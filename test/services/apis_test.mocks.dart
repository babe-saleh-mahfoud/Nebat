// Mocks generated by Mockito 5.3.2 from annotations
// in nebat/test/services/apis_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:mockito/mockito.dart' as _i1;

import 'apis_test.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [DataMap].
///
/// See the documentation for Mockito's code generation for more information.
class MockDataMap extends _i1.Mock implements _i2.DataMap {
  @override
  List<Map<String, dynamic>> get data => (super.noSuchMethod(
        Invocation.getter(#data),
        returnValue: <Map<String, dynamic>>[],
        returnValueForMissingStub: <Map<String, dynamic>>[],
      ) as List<Map<String, dynamic>>);
  @override
  set data(List<Map<String, dynamic>>? _data) => super.noSuchMethod(
        Invocation.setter(
          #data,
          _data,
        ),
        returnValueForMissingStub: null,
      );
}
