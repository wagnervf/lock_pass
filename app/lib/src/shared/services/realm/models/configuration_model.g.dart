// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ConfigurationModel extends _ConfigurationModel
    with RealmEntity, RealmObjectBase, RealmObject {
  ConfigurationModel(
    String themeModeNome, {
    DateTime? syncDate,
  }) {
    RealmObjectBase.set(this, 'themeModeNome', themeModeNome);
    RealmObjectBase.set(this, 'syncDate', syncDate);
  }

  ConfigurationModel._();

  @override
  String get themeModeNome =>
      RealmObjectBase.get<String>(this, 'themeModeNome') as String;
  @override
  set themeModeNome(String value) =>
      RealmObjectBase.set(this, 'themeModeNome', value);

  @override
  DateTime? get syncDate =>
      RealmObjectBase.get<DateTime>(this, 'syncDate') as DateTime?;
  @override
  set syncDate(DateTime? value) => RealmObjectBase.set(this, 'syncDate', value);

  @override
  Stream<RealmObjectChanges<ConfigurationModel>> get changes =>
      RealmObjectBase.getChanges<ConfigurationModel>(this);

  @override
  ConfigurationModel freeze() =>
      RealmObjectBase.freezeObject<ConfigurationModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ConfigurationModel._);
    return const SchemaObject(
        ObjectType.realmObject, ConfigurationModel, 'ConfigurationModel', [
      SchemaProperty('themeModeNome', RealmPropertyType.string),
      SchemaProperty('syncDate', RealmPropertyType.timestamp, optional: true),
    ]);
  }
}
