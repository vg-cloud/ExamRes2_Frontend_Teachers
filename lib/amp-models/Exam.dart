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
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Exam type in your schema. */
class Exam extends amplify_core.Model {
  static const classType = const _ExamModelType();
  final String id;
  final String? _subject;
  final amplify_core.TemporalDateTime? _date;
  final String? _teacherName;
  final List<Result>? _results;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ExamModelIdentifier get modelIdentifier {
      return ExamModelIdentifier(
        id: id
      );
  }
  
  String? get subject {
    return _subject;
  }
  
  amplify_core.TemporalDateTime? get date {
    return _date;
  }
  
  String? get teacherName {
    return _teacherName;
  }
  
  List<Result>? get results {
    return _results;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Exam._internal({required this.id, subject, date, teacherName, results, createdAt, updatedAt}): _subject = subject, _date = date, _teacherName = teacherName, _results = results, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Exam({String? id, String? subject, amplify_core.TemporalDateTime? date, String? teacherName, List<Result>? results}) {
    return Exam._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      subject: subject,
      date: date,
      teacherName: teacherName,
      results: results != null ? List<Result>.unmodifiable(results) : results);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Exam &&
      id == other.id &&
      _subject == other._subject &&
      _date == other._date &&
      _teacherName == other._teacherName &&
      DeepCollectionEquality().equals(_results, other._results);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Exam {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("subject=" + "$_subject" + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("teacherName=" + "$_teacherName" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Exam copyWith({String? subject, amplify_core.TemporalDateTime? date, String? teacherName, List<Result>? results}) {
    return Exam._internal(
      id: id,
      subject: subject ?? this.subject,
      date: date ?? this.date,
      teacherName: teacherName ?? this.teacherName,
      results: results ?? this.results);
  }
  
  Exam copyWithModelFieldValues({
    ModelFieldValue<String?>? subject,
    ModelFieldValue<amplify_core.TemporalDateTime?>? date,
    ModelFieldValue<String?>? teacherName,
    ModelFieldValue<List<Result>?>? results
  }) {
    return Exam._internal(
      id: id,
      subject: subject == null ? this.subject : subject.value,
      date: date == null ? this.date : date.value,
      teacherName: teacherName == null ? this.teacherName : teacherName.value,
      results: results == null ? this.results : results.value
    );
  }
  
  Exam.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _subject = json['subject'],
      _date = json['date'] != null ? amplify_core.TemporalDateTime.fromString(json['date']) : null,
      _teacherName = json['teacherName'],
      _results = json['results']  is Map
        ? (json['results']['items'] is List
          ? (json['results']['items'] as List)
              .where((e) => e != null)
              .map((e) => Result.fromJson(new Map<String, dynamic>.from(e)))
              .toList()
          : null)
        : (json['results'] is List
          ? (json['results'] as List)
              .where((e) => e?['serializedData'] != null)
              .map((e) => Result.fromJson(new Map<String, dynamic>.from(e?['serializedData'])))
              .toList()
          : null),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'subject': _subject, 'date': _date?.format(), 'teacherName': _teacherName, 'results': _results?.map((Result? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'subject': _subject,
    'date': _date,
    'teacherName': _teacherName,
    'results': _results,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ExamModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ExamModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final SUBJECT = amplify_core.QueryField(fieldName: "subject");
  static final DATE = amplify_core.QueryField(fieldName: "date");
  static final TEACHERNAME = amplify_core.QueryField(fieldName: "teacherName");
  static final RESULTS = amplify_core.QueryField(
    fieldName: "results",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Result'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Exam";
    modelSchemaDefinition.pluralName = "Exams";
    
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
      key: Exam.SUBJECT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Exam.DATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Exam.TEACHERNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Exam.RESULTS,
      isRequired: false,
      ofModelName: 'Result',
      associatedKey: Result.EXAM
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

class _ExamModelType extends amplify_core.ModelType<Exam> {
  const _ExamModelType();
  
  @override
  Exam fromJson(Map<String, dynamic> jsonData) {
    return Exam.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Exam';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Exam] in your schema.
 */
class ExamModelIdentifier implements amplify_core.ModelIdentifier<Exam> {
  final String id;

  /** Create an instance of ExamModelIdentifier using [id] the primary key. */
  const ExamModelIdentifier({
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
  String toString() => 'ExamModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ExamModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}