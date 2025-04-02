/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Result type in your schema. */
class Result extends amplify_core.Model {
  static const classType = const _ResultModelType();
  final String id;
  final String? _studentName;
  final int? _grade;
  final Exam? _exam;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ResultModelIdentifier get modelIdentifier {
      return ResultModelIdentifier(
        id: id
      );
  }
  
  String? get studentName {
    return _studentName;
  }
  
  int? get grade {
    return _grade;
  }
  
  Exam? get exam {
    return _exam;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Result._internal({required this.id, studentName, grade, exam, createdAt, updatedAt}): _studentName = studentName, _grade = grade, _exam = exam, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Result({String? id, String? studentName, int? grade, Exam? exam}) {
    return Result._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      studentName: studentName,
      grade: grade,
      exam: exam);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Result &&
      id == other.id &&
      _studentName == other._studentName &&
      _grade == other._grade &&
      _exam == other._exam;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Result {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("studentName=" + "$_studentName" + ", ");
    buffer.write("grade=" + (_grade != null ? _grade!.toString() : "null") + ", ");
    buffer.write("exam=" + (_exam != null ? _exam!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Result copyWith({String? studentName, int? grade, Exam? exam}) {
    return Result._internal(
      id: id,
      studentName: studentName ?? this.studentName,
      grade: grade ?? this.grade,
      exam: exam ?? this.exam);
  }
  
  Result copyWithModelFieldValues({
    ModelFieldValue<String?>? studentName,
    ModelFieldValue<int?>? grade,
    ModelFieldValue<Exam?>? exam
  }) {
    return Result._internal(
      id: id,
      studentName: studentName == null ? this.studentName : studentName.value,
      grade: grade == null ? this.grade : grade.value,
      exam: exam == null ? this.exam : exam.value
    );
  }
  
  Result.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _studentName = json['studentName'],
      _grade = (json['grade'] as num?)?.toInt(),
      _exam = json['exam'] != null
        ? json['exam']['serializedData'] != null
          ? Exam.fromJson(new Map<String, dynamic>.from(json['exam']['serializedData']))
          : Exam.fromJson(new Map<String, dynamic>.from(json['exam']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'studentName': _studentName, 'grade': _grade, 'exam': _exam?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'studentName': _studentName,
    'grade': _grade,
    'exam': _exam,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ResultModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ResultModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final STUDENTNAME = amplify_core.QueryField(fieldName: "studentName");
  static final GRADE = amplify_core.QueryField(fieldName: "grade");
  static final EXAM = amplify_core.QueryField(
    fieldName: "exam",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Exam'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Result";
    modelSchemaDefinition.pluralName = "Results";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        provider: amplify_core.AuthRuleProvider.IAM,
        operations: const [
          amplify_core.ModelOperation.READ
        ]),
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["id"], name: null)
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Result.STUDENTNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Result.GRADE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Result.EXAM,
      isRequired: false,
      targetNames: ['examId'],
      ofModelName: 'Exam'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ResultModelType extends amplify_core.ModelType<Result> {
  const _ResultModelType();
  
  @override
  Result fromJson(Map<String, dynamic> jsonData) {
    return Result.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Result';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Result] in your schema.
 */
class ResultModelIdentifier implements amplify_core.ModelIdentifier<Result> {
  final String id;

  /** Create an instance of ResultModelIdentifier using [id] the primary key. */
  const ResultModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'ResultModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ResultModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}