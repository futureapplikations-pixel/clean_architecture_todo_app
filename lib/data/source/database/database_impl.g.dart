// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_impl.dart';

// ignore_for_file: type=lint
class Mementos extends Table with TableInfo<Mementos, Memento> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Mementos(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _photoMeta = const VerificationMeta('photo');
  late final GeneratedColumn<String> photo = GeneratedColumn<String>(
      'photo', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _contextMeta =
      const VerificationMeta('context');
  late final GeneratedColumn<String> context = GeneratedColumn<String>(
      'context', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _jobTitleMeta =
      const VerificationMeta('jobTitle');
  late final GeneratedColumn<String> jobTitle = GeneratedColumn<String>(
      'job_title', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _companyMeta =
      const VerificationMeta('company');
  late final GeneratedColumn<String> company = GeneratedColumn<String>(
      'company', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _birthdayMeta =
      const VerificationMeta('birthday');
  late final GeneratedColumn<int> birthday = GeneratedColumn<int>(
      'birthday', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, photo, email, phone, context, jobTitle, company, birthday];
  @override
  String get aliasedName => _alias ?? 'mementos';
  @override
  String get actualTableName => 'mementos';
  @override
  VerificationContext validateIntegrity(Insertable<Memento> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo']!, _photoMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('context')) {
      context.handle(_contextMeta,
          this.context.isAcceptableOrUnknown(data['context']!, _contextMeta));
    }
    if (data.containsKey('job_title')) {
      context.handle(_jobTitleMeta,
          jobTitle.isAcceptableOrUnknown(data['job_title']!, _jobTitleMeta));
    }
    if (data.containsKey('company')) {
      context.handle(_companyMeta,
          company.isAcceptableOrUnknown(data['company']!, _companyMeta));
    }
    if (data.containsKey('birthday')) {
      context.handle(_birthdayMeta,
          birthday.isAcceptableOrUnknown(data['birthday']!, _birthdayMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Memento map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Memento(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      photo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      context: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}context']),
      jobTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}job_title']),
      company: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company']),
      birthday: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}birthday']),
    );
  }

  @override
  Mementos createAlias(String alias) {
    return Mementos(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Memento extends DataClass implements Insertable<Memento> {
  final int id;
  final String name;
  final String? photo;
  final String? email;
  final String? phone;
  final String? context;
  final String? jobTitle;
  final String? company;
  final int? birthday;
  const Memento(
      {required this.id,
      required this.name,
      this.photo,
      this.email,
      this.phone,
      this.context,
      this.jobTitle,
      this.company,
      this.birthday});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || photo != null) {
      map['photo'] = Variable<String>(photo);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || context != null) {
      map['context'] = Variable<String>(context);
    }
    if (!nullToAbsent || jobTitle != null) {
      map['job_title'] = Variable<String>(jobTitle);
    }
    if (!nullToAbsent || company != null) {
      map['company'] = Variable<String>(company);
    }
    if (!nullToAbsent || birthday != null) {
      map['birthday'] = Variable<int>(birthday);
    }
    return map;
  }

  MementosCompanion toCompanion(bool nullToAbsent) {
    return MementosCompanion(
      id: Value(id),
      name: Value(name),
      photo:
          photo == null && nullToAbsent ? const Value.absent() : Value(photo),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      context: context == null && nullToAbsent
          ? const Value.absent()
          : Value(context),
      jobTitle: jobTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(jobTitle),
      company: company == null && nullToAbsent
          ? const Value.absent()
          : Value(company),
      birthday: birthday == null && nullToAbsent
          ? const Value.absent()
          : Value(birthday),
    );
  }

  factory Memento.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Memento(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      photo: serializer.fromJson<String?>(json['photo']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      context: serializer.fromJson<String?>(json['context']),
      jobTitle: serializer.fromJson<String?>(json['job_title']),
      company: serializer.fromJson<String?>(json['company']),
      birthday: serializer.fromJson<int?>(json['birthday']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'photo': serializer.toJson<String?>(photo),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'context': serializer.toJson<String?>(context),
      'job_title': serializer.toJson<String?>(jobTitle),
      'company': serializer.toJson<String?>(company),
      'birthday': serializer.toJson<int?>(birthday),
    };
  }

  Memento copyWith(
          {int? id,
          String? name,
          Value<String?> photo = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> context = const Value.absent(),
          Value<String?> jobTitle = const Value.absent(),
          Value<String?> company = const Value.absent(),
          Value<int?> birthday = const Value.absent()}) =>
      Memento(
        id: id ?? this.id,
        name: name ?? this.name,
        photo: photo.present ? photo.value : this.photo,
        email: email.present ? email.value : this.email,
        phone: phone.present ? phone.value : this.phone,
        context: context.present ? context.value : this.context,
        jobTitle: jobTitle.present ? jobTitle.value : this.jobTitle,
        company: company.present ? company.value : this.company,
        birthday: birthday.present ? birthday.value : this.birthday,
      );
  @override
  String toString() {
    return (StringBuffer('Memento(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('photo: $photo, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('context: $context, ')
          ..write('jobTitle: $jobTitle, ')
          ..write('company: $company, ')
          ..write('birthday: $birthday')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, photo, email, phone, context, jobTitle, company, birthday);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Memento &&
          other.id == this.id &&
          other.name == this.name &&
          other.photo == this.photo &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.context == this.context &&
          other.jobTitle == this.jobTitle &&
          other.company == this.company &&
          other.birthday == this.birthday);
}

class MementosCompanion extends UpdateCompanion<Memento> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> photo;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> context;
  final Value<String?> jobTitle;
  final Value<String?> company;
  final Value<int?> birthday;
  const MementosCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.photo = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.context = const Value.absent(),
    this.jobTitle = const Value.absent(),
    this.company = const Value.absent(),
    this.birthday = const Value.absent(),
  });
  MementosCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.photo = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.context = const Value.absent(),
    this.jobTitle = const Value.absent(),
    this.company = const Value.absent(),
    this.birthday = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Memento> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? photo,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? context,
    Expression<String>? jobTitle,
    Expression<String>? company,
    Expression<int>? birthday,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (photo != null) 'photo': photo,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (context != null) 'context': context,
      if (jobTitle != null) 'job_title': jobTitle,
      if (company != null) 'company': company,
      if (birthday != null) 'birthday': birthday,
    });
  }

  MementosCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? photo,
      Value<String?>? email,
      Value<String?>? phone,
      Value<String?>? context,
      Value<String?>? jobTitle,
      Value<String?>? company,
      Value<int?>? birthday}) {
    return MementosCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      context: context ?? this.context,
      jobTitle: jobTitle ?? this.jobTitle,
      company: company ?? this.company,
      birthday: birthday ?? this.birthday,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (photo.present) {
      map['photo'] = Variable<String>(photo.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (context.present) {
      map['context'] = Variable<String>(context.value);
    }
    if (jobTitle.present) {
      map['job_title'] = Variable<String>(jobTitle.value);
    }
    if (company.present) {
      map['company'] = Variable<String>(company.value);
    }
    if (birthday.present) {
      map['birthday'] = Variable<int>(birthday.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MementosCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('photo: $photo, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('context: $context, ')
          ..write('jobTitle: $jobTitle, ')
          ..write('company: $company, ')
          ..write('birthday: $birthday')
          ..write(')'))
        .toString();
  }
}

class MementoEntries extends Table
    with
        TableInfo<MementoEntries, MementoEntrie>,
        VirtualTableInfo<MementoEntries, MementoEntrie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MementoEntries(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _contextMeta =
      const VerificationMeta('context');
  late final GeneratedColumn<String> context = GeneratedColumn<String>(
      'context', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  static const VerificationMeta _companyMeta =
      const VerificationMeta('company');
  late final GeneratedColumn<String> company = GeneratedColumn<String>(
      'company', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [name, context, company];
  @override
  String get aliasedName => _alias ?? 'memento_entries';
  @override
  String get actualTableName => 'memento_entries';
  @override
  VerificationContext validateIntegrity(Insertable<MementoEntrie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('context')) {
      context.handle(_contextMeta,
          this.context.isAcceptableOrUnknown(data['context']!, _contextMeta));
    } else if (isInserting) {
      context.missing(_contextMeta);
    }
    if (data.containsKey('company')) {
      context.handle(_companyMeta,
          company.isAcceptableOrUnknown(data['company']!, _companyMeta));
    } else if (isInserting) {
      context.missing(_companyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  MementoEntrie map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MementoEntrie(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      context: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}context'])!,
      company: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company'])!,
    );
  }

  @override
  MementoEntries createAlias(String alias) {
    return MementoEntries(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'fts5(name, context, company, content=mementos, content_rowid=id)';
}

class MementoEntrie extends DataClass implements Insertable<MementoEntrie> {
  final String name;
  final String context;
  final String company;
  const MementoEntrie(
      {required this.name, required this.context, required this.company});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['context'] = Variable<String>(context);
    map['company'] = Variable<String>(company);
    return map;
  }

  MementoEntriesCompanion toCompanion(bool nullToAbsent) {
    return MementoEntriesCompanion(
      name: Value(name),
      context: Value(context),
      company: Value(company),
    );
  }

  factory MementoEntrie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MementoEntrie(
      name: serializer.fromJson<String>(json['name']),
      context: serializer.fromJson<String>(json['context']),
      company: serializer.fromJson<String>(json['company']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'context': serializer.toJson<String>(context),
      'company': serializer.toJson<String>(company),
    };
  }

  MementoEntrie copyWith({String? name, String? context, String? company}) =>
      MementoEntrie(
        name: name ?? this.name,
        context: context ?? this.context,
        company: company ?? this.company,
      );
  @override
  String toString() {
    return (StringBuffer('MementoEntrie(')
          ..write('name: $name, ')
          ..write('context: $context, ')
          ..write('company: $company')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, context, company);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MementoEntrie &&
          other.name == this.name &&
          other.context == this.context &&
          other.company == this.company);
}

class MementoEntriesCompanion extends UpdateCompanion<MementoEntrie> {
  final Value<String> name;
  final Value<String> context;
  final Value<String> company;
  final Value<int> rowid;
  const MementoEntriesCompanion({
    this.name = const Value.absent(),
    this.context = const Value.absent(),
    this.company = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MementoEntriesCompanion.insert({
    required String name,
    required String context,
    required String company,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        context = Value(context),
        company = Value(company);
  static Insertable<MementoEntrie> custom({
    Expression<String>? name,
    Expression<String>? context,
    Expression<String>? company,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (context != null) 'context': context,
      if (company != null) 'company': company,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MementoEntriesCompanion copyWith(
      {Value<String>? name,
      Value<String>? context,
      Value<String>? company,
      Value<int>? rowid}) {
    return MementoEntriesCompanion(
      name: name ?? this.name,
      context: context ?? this.context,
      company: company ?? this.company,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (context.present) {
      map['context'] = Variable<String>(context.value);
    }
    if (company.present) {
      map['company'] = Variable<String>(company.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MementoEntriesCompanion(')
          ..write('name: $name, ')
          ..write('context: $context, ')
          ..write('company: $company, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Labels extends Table with TableInfo<Labels, Label> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Labels(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name, color];
  @override
  String get aliasedName => _alias ?? 'labels';
  @override
  String get actualTableName => 'labels';
  @override
  VerificationContext validateIntegrity(Insertable<Label> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Label map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Label(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color'])!,
    );
  }

  @override
  Labels createAlias(String alias) {
    return Labels(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Label extends DataClass implements Insertable<Label> {
  final int id;
  final String name;
  final int color;
  const Label({required this.id, required this.name, required this.color});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['color'] = Variable<int>(color);
    return map;
  }

  LabelsCompanion toCompanion(bool nullToAbsent) {
    return LabelsCompanion(
      id: Value(id),
      name: Value(name),
      color: Value(color),
    );
  }

  factory Label.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Label(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      color: serializer.fromJson<int>(json['color']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'color': serializer.toJson<int>(color),
    };
  }

  Label copyWith({int? id, String? name, int? color}) => Label(
        id: id ?? this.id,
        name: name ?? this.name,
        color: color ?? this.color,
      );
  @override
  String toString() {
    return (StringBuffer('Label(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, color);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Label &&
          other.id == this.id &&
          other.name == this.name &&
          other.color == this.color);
}

class LabelsCompanion extends UpdateCompanion<Label> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> color;
  const LabelsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.color = const Value.absent(),
  });
  LabelsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int color,
  })  : name = Value(name),
        color = Value(color);
  static Insertable<Label> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? color,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (color != null) 'color': color,
    });
  }

  LabelsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? color}) {
    return LabelsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LabelsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('color: $color')
          ..write(')'))
        .toString();
  }
}

class MementoLabels extends Table with TableInfo<MementoLabels, MementoLabel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MementoLabels(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mementoIdMeta =
      const VerificationMeta('mementoId');
  late final GeneratedColumn<int> mementoId = GeneratedColumn<int>(
      'memento_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _labelIdMeta =
      const VerificationMeta('labelId');
  late final GeneratedColumn<int> labelId = GeneratedColumn<int>(
      'label_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [mementoId, labelId];
  @override
  String get aliasedName => _alias ?? 'memento_labels';
  @override
  String get actualTableName => 'memento_labels';
  @override
  VerificationContext validateIntegrity(Insertable<MementoLabel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('memento_id')) {
      context.handle(_mementoIdMeta,
          mementoId.isAcceptableOrUnknown(data['memento_id']!, _mementoIdMeta));
    } else if (isInserting) {
      context.missing(_mementoIdMeta);
    }
    if (data.containsKey('label_id')) {
      context.handle(_labelIdMeta,
          labelId.isAcceptableOrUnknown(data['label_id']!, _labelIdMeta));
    } else if (isInserting) {
      context.missing(_labelIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mementoId, labelId};
  @override
  MementoLabel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MementoLabel(
      mementoId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}memento_id'])!,
      labelId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}label_id'])!,
    );
  }

  @override
  MementoLabels createAlias(String alias) {
    return MementoLabels(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'PRIMARY KEY(memento_id, label_id)',
        'FOREIGN KEY(memento_id)REFERENCES mementos(id)',
        'FOREIGN KEY(label_id)REFERENCES labels(id)'
      ];
  @override
  bool get dontWriteConstraints => true;
}

class MementoLabel extends DataClass implements Insertable<MementoLabel> {
  final int mementoId;
  final int labelId;
  const MementoLabel({required this.mementoId, required this.labelId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['memento_id'] = Variable<int>(mementoId);
    map['label_id'] = Variable<int>(labelId);
    return map;
  }

  MementoLabelsCompanion toCompanion(bool nullToAbsent) {
    return MementoLabelsCompanion(
      mementoId: Value(mementoId),
      labelId: Value(labelId),
    );
  }

  factory MementoLabel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MementoLabel(
      mementoId: serializer.fromJson<int>(json['memento_id']),
      labelId: serializer.fromJson<int>(json['label_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'memento_id': serializer.toJson<int>(mementoId),
      'label_id': serializer.toJson<int>(labelId),
    };
  }

  MementoLabel copyWith({int? mementoId, int? labelId}) => MementoLabel(
        mementoId: mementoId ?? this.mementoId,
        labelId: labelId ?? this.labelId,
      );
  @override
  String toString() {
    return (StringBuffer('MementoLabel(')
          ..write('mementoId: $mementoId, ')
          ..write('labelId: $labelId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mementoId, labelId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MementoLabel &&
          other.mementoId == this.mementoId &&
          other.labelId == this.labelId);
}

class MementoLabelsCompanion extends UpdateCompanion<MementoLabel> {
  final Value<int> mementoId;
  final Value<int> labelId;
  final Value<int> rowid;
  const MementoLabelsCompanion({
    this.mementoId = const Value.absent(),
    this.labelId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MementoLabelsCompanion.insert({
    required int mementoId,
    required int labelId,
    this.rowid = const Value.absent(),
  })  : mementoId = Value(mementoId),
        labelId = Value(labelId);
  static Insertable<MementoLabel> custom({
    Expression<int>? mementoId,
    Expression<int>? labelId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mementoId != null) 'memento_id': mementoId,
      if (labelId != null) 'label_id': labelId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MementoLabelsCompanion copyWith(
      {Value<int>? mementoId, Value<int>? labelId, Value<int>? rowid}) {
    return MementoLabelsCompanion(
      mementoId: mementoId ?? this.mementoId,
      labelId: labelId ?? this.labelId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mementoId.present) {
      map['memento_id'] = Variable<int>(mementoId.value);
    }
    if (labelId.present) {
      map['label_id'] = Variable<int>(labelId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MementoLabelsCompanion(')
          ..write('mementoId: $mementoId, ')
          ..write('labelId: $labelId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Notes extends Table with TableInfo<Notes, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Notes(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT NOT NULL');
  static const VerificationMeta _mementoIdMeta =
      const VerificationMeta('mementoId');
  late final GeneratedColumn<int> mementoId = GeneratedColumn<int>(
      'memento_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _isFavoriteMeta =
      const VerificationMeta('isFavorite');
  late final GeneratedColumn<int> isFavorite = GeneratedColumn<int>(
      'is_favorite', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, mementoId, content, createdAt, updatedAt, isFavorite];
  @override
  String get aliasedName => _alias ?? 'notes';
  @override
  String get actualTableName => 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<Note> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('memento_id')) {
      context.handle(_mementoIdMeta,
          mementoId.isAcceptableOrUnknown(data['memento_id']!, _mementoIdMeta));
    } else if (isInserting) {
      context.missing(_mementoIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite']!, _isFavoriteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      mementoId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}memento_id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at']),
      isFavorite: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_favorite'])!,
    );
  }

  @override
  Notes createAlias(String alias) {
    return Notes(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['FOREIGN KEY(memento_id)REFERENCES mementos(id)'];
  @override
  bool get dontWriteConstraints => true;
}

class Note extends DataClass implements Insertable<Note> {
  final int id;
  final int mementoId;
  final String content;
  final int createdAt;
  final int? updatedAt;
  final int isFavorite;
  const Note(
      {required this.id,
      required this.mementoId,
      required this.content,
      required this.createdAt,
      this.updatedAt,
      required this.isFavorite});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['memento_id'] = Variable<int>(mementoId);
    map['content'] = Variable<String>(content);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<int>(updatedAt);
    }
    map['is_favorite'] = Variable<int>(isFavorite);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      mementoId: Value(mementoId),
      content: Value(content),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      isFavorite: Value(isFavorite),
    );
  }

  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<int>(json['id']),
      mementoId: serializer.fromJson<int>(json['memento_id']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<int>(json['created_at']),
      updatedAt: serializer.fromJson<int?>(json['updated_at']),
      isFavorite: serializer.fromJson<int>(json['is_favorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'memento_id': serializer.toJson<int>(mementoId),
      'content': serializer.toJson<String>(content),
      'created_at': serializer.toJson<int>(createdAt),
      'updated_at': serializer.toJson<int?>(updatedAt),
      'is_favorite': serializer.toJson<int>(isFavorite),
    };
  }

  Note copyWith(
          {int? id,
          int? mementoId,
          String? content,
          int? createdAt,
          Value<int?> updatedAt = const Value.absent(),
          int? isFavorite}) =>
      Note(
        id: id ?? this.id,
        mementoId: mementoId ?? this.mementoId,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        isFavorite: isFavorite ?? this.isFavorite,
      );
  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('mementoId: $mementoId, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, mementoId, content, createdAt, updatedAt, isFavorite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.mementoId == this.mementoId &&
          other.content == this.content &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.isFavorite == this.isFavorite);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<int> id;
  final Value<int> mementoId;
  final Value<String> content;
  final Value<int> createdAt;
  final Value<int?> updatedAt;
  final Value<int> isFavorite;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.mementoId = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isFavorite = const Value.absent(),
  });
  NotesCompanion.insert({
    this.id = const Value.absent(),
    required int mementoId,
    required String content,
    required int createdAt,
    this.updatedAt = const Value.absent(),
    this.isFavorite = const Value.absent(),
  })  : mementoId = Value(mementoId),
        content = Value(content),
        createdAt = Value(createdAt);
  static Insertable<Note> custom({
    Expression<int>? id,
    Expression<int>? mementoId,
    Expression<String>? content,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? isFavorite,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mementoId != null) 'memento_id': mementoId,
      if (content != null) 'content': content,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isFavorite != null) 'is_favorite': isFavorite,
    });
  }

  NotesCompanion copyWith(
      {Value<int>? id,
      Value<int>? mementoId,
      Value<String>? content,
      Value<int>? createdAt,
      Value<int?>? updatedAt,
      Value<int>? isFavorite}) {
    return NotesCompanion(
      id: id ?? this.id,
      mementoId: mementoId ?? this.mementoId,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mementoId.present) {
      map['memento_id'] = Variable<int>(mementoId.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<int>(isFavorite.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('mementoId: $mementoId, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }
}

class ScheduledMessages extends Table
    with TableInfo<ScheduledMessages, ScheduledMessage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ScheduledMessages(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT NOT NULL');
  static const VerificationMeta _mementoIdMeta =
      const VerificationMeta('mementoId');
  late final GeneratedColumn<int> mementoId = GeneratedColumn<int>(
      'memento_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _messageTypeMeta =
      const VerificationMeta('messageType');
  late final GeneratedColumn<String> messageType = GeneratedColumn<String>(
      'message_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _scheduledDateTimeMeta =
      const VerificationMeta('scheduledDateTime');
  late final GeneratedColumn<int> scheduledDateTime = GeneratedColumn<int>(
      'scheduled_date_time', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
      'is_active', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 1',
      defaultValue: const CustomExpression('1'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _sentAtMeta = const VerificationMeta('sentAt');
  late final GeneratedColumn<int> sentAt = GeneratedColumn<int>(
      'sent_at', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        mementoId,
        messageType,
        title,
        content,
        scheduledDateTime,
        isActive,
        createdAt,
        sentAt
      ];
  @override
  String get aliasedName => _alias ?? 'scheduled_messages';
  @override
  String get actualTableName => 'scheduled_messages';
  @override
  VerificationContext validateIntegrity(Insertable<ScheduledMessage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('memento_id')) {
      context.handle(_mementoIdMeta,
          mementoId.isAcceptableOrUnknown(data['memento_id']!, _mementoIdMeta));
    } else if (isInserting) {
      context.missing(_mementoIdMeta);
    }
    if (data.containsKey('message_type')) {
      context.handle(
          _messageTypeMeta,
          messageType.isAcceptableOrUnknown(
              data['message_type']!, _messageTypeMeta));
    } else if (isInserting) {
      context.missing(_messageTypeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('scheduled_date_time')) {
      context.handle(
          _scheduledDateTimeMeta,
          scheduledDateTime.isAcceptableOrUnknown(
              data['scheduled_date_time']!, _scheduledDateTimeMeta));
    } else if (isInserting) {
      context.missing(_scheduledDateTimeMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('sent_at')) {
      context.handle(_sentAtMeta,
          sentAt.isAcceptableOrUnknown(data['sent_at']!, _sentAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScheduledMessage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScheduledMessage(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      mementoId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}memento_id'])!,
      messageType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message_type'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      scheduledDateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}scheduled_date_time'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      sentAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sent_at']),
    );
  }

  @override
  ScheduledMessages createAlias(String alias) {
    return ScheduledMessages(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['FOREIGN KEY(memento_id)REFERENCES mementos(id)'];
  @override
  bool get dontWriteConstraints => true;
}

class ScheduledMessage extends DataClass
    implements Insertable<ScheduledMessage> {
  final int id;
  final int mementoId;
  final String messageType;
  final String title;
  final String content;
  final int scheduledDateTime;
  final int isActive;
  final int createdAt;
  final int? sentAt;
  const ScheduledMessage(
      {required this.id,
      required this.mementoId,
      required this.messageType,
      required this.title,
      required this.content,
      required this.scheduledDateTime,
      required this.isActive,
      required this.createdAt,
      this.sentAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['memento_id'] = Variable<int>(mementoId);
    map['message_type'] = Variable<String>(messageType);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['scheduled_date_time'] = Variable<int>(scheduledDateTime);
    map['is_active'] = Variable<int>(isActive);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || sentAt != null) {
      map['sent_at'] = Variable<int>(sentAt);
    }
    return map;
  }

  ScheduledMessagesCompanion toCompanion(bool nullToAbsent) {
    return ScheduledMessagesCompanion(
      id: Value(id),
      mementoId: Value(mementoId),
      messageType: Value(messageType),
      title: Value(title),
      content: Value(content),
      scheduledDateTime: Value(scheduledDateTime),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      sentAt:
          sentAt == null && nullToAbsent ? const Value.absent() : Value(sentAt),
    );
  }

  factory ScheduledMessage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScheduledMessage(
      id: serializer.fromJson<int>(json['id']),
      mementoId: serializer.fromJson<int>(json['memento_id']),
      messageType: serializer.fromJson<String>(json['message_type']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      scheduledDateTime: serializer.fromJson<int>(json['scheduled_date_time']),
      isActive: serializer.fromJson<int>(json['is_active']),
      createdAt: serializer.fromJson<int>(json['created_at']),
      sentAt: serializer.fromJson<int?>(json['sent_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'memento_id': serializer.toJson<int>(mementoId),
      'message_type': serializer.toJson<String>(messageType),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'scheduled_date_time': serializer.toJson<int>(scheduledDateTime),
      'is_active': serializer.toJson<int>(isActive),
      'created_at': serializer.toJson<int>(createdAt),
      'sent_at': serializer.toJson<int?>(sentAt),
    };
  }

  ScheduledMessage copyWith(
          {int? id,
          int? mementoId,
          String? messageType,
          String? title,
          String? content,
          int? scheduledDateTime,
          int? isActive,
          int? createdAt,
          Value<int?> sentAt = const Value.absent()}) =>
      ScheduledMessage(
        id: id ?? this.id,
        mementoId: mementoId ?? this.mementoId,
        messageType: messageType ?? this.messageType,
        title: title ?? this.title,
        content: content ?? this.content,
        scheduledDateTime: scheduledDateTime ?? this.scheduledDateTime,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        sentAt: sentAt.present ? sentAt.value : this.sentAt,
      );
  @override
  String toString() {
    return (StringBuffer('ScheduledMessage(')
          ..write('id: $id, ')
          ..write('mementoId: $mementoId, ')
          ..write('messageType: $messageType, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('scheduledDateTime: $scheduledDateTime, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('sentAt: $sentAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, mementoId, messageType, title, content,
      scheduledDateTime, isActive, createdAt, sentAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduledMessage &&
          other.id == this.id &&
          other.mementoId == this.mementoId &&
          other.messageType == this.messageType &&
          other.title == this.title &&
          other.content == this.content &&
          other.scheduledDateTime == this.scheduledDateTime &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.sentAt == this.sentAt);
}

class ScheduledMessagesCompanion extends UpdateCompanion<ScheduledMessage> {
  final Value<int> id;
  final Value<int> mementoId;
  final Value<String> messageType;
  final Value<String> title;
  final Value<String> content;
  final Value<int> scheduledDateTime;
  final Value<int> isActive;
  final Value<int> createdAt;
  final Value<int?> sentAt;
  const ScheduledMessagesCompanion({
    this.id = const Value.absent(),
    this.mementoId = const Value.absent(),
    this.messageType = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.scheduledDateTime = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.sentAt = const Value.absent(),
  });
  ScheduledMessagesCompanion.insert({
    this.id = const Value.absent(),
    required int mementoId,
    required String messageType,
    required String title,
    required String content,
    required int scheduledDateTime,
    this.isActive = const Value.absent(),
    required int createdAt,
    this.sentAt = const Value.absent(),
  })  : mementoId = Value(mementoId),
        messageType = Value(messageType),
        title = Value(title),
        content = Value(content),
        scheduledDateTime = Value(scheduledDateTime),
        createdAt = Value(createdAt);
  static Insertable<ScheduledMessage> custom({
    Expression<int>? id,
    Expression<int>? mementoId,
    Expression<String>? messageType,
    Expression<String>? title,
    Expression<String>? content,
    Expression<int>? scheduledDateTime,
    Expression<int>? isActive,
    Expression<int>? createdAt,
    Expression<int>? sentAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mementoId != null) 'memento_id': mementoId,
      if (messageType != null) 'message_type': messageType,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (scheduledDateTime != null) 'scheduled_date_time': scheduledDateTime,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (sentAt != null) 'sent_at': sentAt,
    });
  }

  ScheduledMessagesCompanion copyWith(
      {Value<int>? id,
      Value<int>? mementoId,
      Value<String>? messageType,
      Value<String>? title,
      Value<String>? content,
      Value<int>? scheduledDateTime,
      Value<int>? isActive,
      Value<int>? createdAt,
      Value<int?>? sentAt}) {
    return ScheduledMessagesCompanion(
      id: id ?? this.id,
      mementoId: mementoId ?? this.mementoId,
      messageType: messageType ?? this.messageType,
      title: title ?? this.title,
      content: content ?? this.content,
      scheduledDateTime: scheduledDateTime ?? this.scheduledDateTime,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      sentAt: sentAt ?? this.sentAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mementoId.present) {
      map['memento_id'] = Variable<int>(mementoId.value);
    }
    if (messageType.present) {
      map['message_type'] = Variable<String>(messageType.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (scheduledDateTime.present) {
      map['scheduled_date_time'] = Variable<int>(scheduledDateTime.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (sentAt.present) {
      map['sent_at'] = Variable<int>(sentAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduledMessagesCompanion(')
          ..write('id: $id, ')
          ..write('mementoId: $mementoId, ')
          ..write('messageType: $messageType, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('scheduledDateTime: $scheduledDateTime, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('sentAt: $sentAt')
          ..write(')'))
        .toString();
  }
}

class Achievements extends Table with TableInfo<Achievements, Achievement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Achievements(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
      'points', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _unlockedMeta =
      const VerificationMeta('unlocked');
  late final GeneratedColumn<int> unlocked = GeneratedColumn<int>(
      'unlocked', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  static const VerificationMeta _unlockedDateMeta =
      const VerificationMeta('unlockedDate');
  late final GeneratedColumn<int> unlockedDate = GeneratedColumn<int>(
      'unlocked_date', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _progressMeta =
      const VerificationMeta('progress');
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
      'progress', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0.0',
      defaultValue: const CustomExpression('0.0'));
  static const VerificationMeta _requirementMeta =
      const VerificationMeta('requirement');
  late final GeneratedColumn<int> requirement = GeneratedColumn<int>(
      'requirement', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _currentProgressMeta =
      const VerificationMeta('currentProgress');
  late final GeneratedColumn<int> currentProgress = GeneratedColumn<int>(
      'current_progress', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        icon,
        category,
        points,
        unlocked,
        unlockedDate,
        progress,
        requirement,
        currentProgress
      ];
  @override
  String get aliasedName => _alias ?? 'achievements';
  @override
  String get actualTableName => 'achievements';
  @override
  VerificationContext validateIntegrity(Insertable<Achievement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('points')) {
      context.handle(_pointsMeta,
          points.isAcceptableOrUnknown(data['points']!, _pointsMeta));
    } else if (isInserting) {
      context.missing(_pointsMeta);
    }
    if (data.containsKey('unlocked')) {
      context.handle(_unlockedMeta,
          unlocked.isAcceptableOrUnknown(data['unlocked']!, _unlockedMeta));
    }
    if (data.containsKey('unlocked_date')) {
      context.handle(
          _unlockedDateMeta,
          unlockedDate.isAcceptableOrUnknown(
              data['unlocked_date']!, _unlockedDateMeta));
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress']!, _progressMeta));
    }
    if (data.containsKey('requirement')) {
      context.handle(
          _requirementMeta,
          requirement.isAcceptableOrUnknown(
              data['requirement']!, _requirementMeta));
    } else if (isInserting) {
      context.missing(_requirementMeta);
    }
    if (data.containsKey('current_progress')) {
      context.handle(
          _currentProgressMeta,
          currentProgress.isAcceptableOrUnknown(
              data['current_progress']!, _currentProgressMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Achievement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Achievement(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      points: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}points'])!,
      unlocked: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unlocked'])!,
      unlockedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unlocked_date']),
      progress: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}progress'])!,
      requirement: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}requirement'])!,
      currentProgress: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}current_progress'])!,
    );
  }

  @override
  Achievements createAlias(String alias) {
    return Achievements(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Achievement extends DataClass implements Insertable<Achievement> {
  final String id;
  final String name;
  final String description;
  final String icon;
  final String category;
  final int points;
  final int unlocked;
  final int? unlockedDate;
  final double progress;
  final int requirement;
  final int currentProgress;
  const Achievement(
      {required this.id,
      required this.name,
      required this.description,
      required this.icon,
      required this.category,
      required this.points,
      required this.unlocked,
      this.unlockedDate,
      required this.progress,
      required this.requirement,
      required this.currentProgress});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['icon'] = Variable<String>(icon);
    map['category'] = Variable<String>(category);
    map['points'] = Variable<int>(points);
    map['unlocked'] = Variable<int>(unlocked);
    if (!nullToAbsent || unlockedDate != null) {
      map['unlocked_date'] = Variable<int>(unlockedDate);
    }
    map['progress'] = Variable<double>(progress);
    map['requirement'] = Variable<int>(requirement);
    map['current_progress'] = Variable<int>(currentProgress);
    return map;
  }

  AchievementsCompanion toCompanion(bool nullToAbsent) {
    return AchievementsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      icon: Value(icon),
      category: Value(category),
      points: Value(points),
      unlocked: Value(unlocked),
      unlockedDate: unlockedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(unlockedDate),
      progress: Value(progress),
      requirement: Value(requirement),
      currentProgress: Value(currentProgress),
    );
  }

  factory Achievement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Achievement(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      icon: serializer.fromJson<String>(json['icon']),
      category: serializer.fromJson<String>(json['category']),
      points: serializer.fromJson<int>(json['points']),
      unlocked: serializer.fromJson<int>(json['unlocked']),
      unlockedDate: serializer.fromJson<int?>(json['unlocked_date']),
      progress: serializer.fromJson<double>(json['progress']),
      requirement: serializer.fromJson<int>(json['requirement']),
      currentProgress: serializer.fromJson<int>(json['current_progress']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'icon': serializer.toJson<String>(icon),
      'category': serializer.toJson<String>(category),
      'points': serializer.toJson<int>(points),
      'unlocked': serializer.toJson<int>(unlocked),
      'unlocked_date': serializer.toJson<int?>(unlockedDate),
      'progress': serializer.toJson<double>(progress),
      'requirement': serializer.toJson<int>(requirement),
      'current_progress': serializer.toJson<int>(currentProgress),
    };
  }

  Achievement copyWith(
          {String? id,
          String? name,
          String? description,
          String? icon,
          String? category,
          int? points,
          int? unlocked,
          Value<int?> unlockedDate = const Value.absent(),
          double? progress,
          int? requirement,
          int? currentProgress}) =>
      Achievement(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        icon: icon ?? this.icon,
        category: category ?? this.category,
        points: points ?? this.points,
        unlocked: unlocked ?? this.unlocked,
        unlockedDate:
            unlockedDate.present ? unlockedDate.value : this.unlockedDate,
        progress: progress ?? this.progress,
        requirement: requirement ?? this.requirement,
        currentProgress: currentProgress ?? this.currentProgress,
      );
  @override
  String toString() {
    return (StringBuffer('Achievement(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('icon: $icon, ')
          ..write('category: $category, ')
          ..write('points: $points, ')
          ..write('unlocked: $unlocked, ')
          ..write('unlockedDate: $unlockedDate, ')
          ..write('progress: $progress, ')
          ..write('requirement: $requirement, ')
          ..write('currentProgress: $currentProgress')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, icon, category, points,
      unlocked, unlockedDate, progress, requirement, currentProgress);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Achievement &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.icon == this.icon &&
          other.category == this.category &&
          other.points == this.points &&
          other.unlocked == this.unlocked &&
          other.unlockedDate == this.unlockedDate &&
          other.progress == this.progress &&
          other.requirement == this.requirement &&
          other.currentProgress == this.currentProgress);
}

class AchievementsCompanion extends UpdateCompanion<Achievement> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> icon;
  final Value<String> category;
  final Value<int> points;
  final Value<int> unlocked;
  final Value<int?> unlockedDate;
  final Value<double> progress;
  final Value<int> requirement;
  final Value<int> currentProgress;
  final Value<int> rowid;
  const AchievementsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.icon = const Value.absent(),
    this.category = const Value.absent(),
    this.points = const Value.absent(),
    this.unlocked = const Value.absent(),
    this.unlockedDate = const Value.absent(),
    this.progress = const Value.absent(),
    this.requirement = const Value.absent(),
    this.currentProgress = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AchievementsCompanion.insert({
    required String id,
    required String name,
    required String description,
    required String icon,
    required String category,
    required int points,
    this.unlocked = const Value.absent(),
    this.unlockedDate = const Value.absent(),
    this.progress = const Value.absent(),
    required int requirement,
    this.currentProgress = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        description = Value(description),
        icon = Value(icon),
        category = Value(category),
        points = Value(points),
        requirement = Value(requirement);
  static Insertable<Achievement> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? icon,
    Expression<String>? category,
    Expression<int>? points,
    Expression<int>? unlocked,
    Expression<int>? unlockedDate,
    Expression<double>? progress,
    Expression<int>? requirement,
    Expression<int>? currentProgress,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (icon != null) 'icon': icon,
      if (category != null) 'category': category,
      if (points != null) 'points': points,
      if (unlocked != null) 'unlocked': unlocked,
      if (unlockedDate != null) 'unlocked_date': unlockedDate,
      if (progress != null) 'progress': progress,
      if (requirement != null) 'requirement': requirement,
      if (currentProgress != null) 'current_progress': currentProgress,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AchievementsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? description,
      Value<String>? icon,
      Value<String>? category,
      Value<int>? points,
      Value<int>? unlocked,
      Value<int?>? unlockedDate,
      Value<double>? progress,
      Value<int>? requirement,
      Value<int>? currentProgress,
      Value<int>? rowid}) {
    return AchievementsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      category: category ?? this.category,
      points: points ?? this.points,
      unlocked: unlocked ?? this.unlocked,
      unlockedDate: unlockedDate ?? this.unlockedDate,
      progress: progress ?? this.progress,
      requirement: requirement ?? this.requirement,
      currentProgress: currentProgress ?? this.currentProgress,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    if (unlocked.present) {
      map['unlocked'] = Variable<int>(unlocked.value);
    }
    if (unlockedDate.present) {
      map['unlocked_date'] = Variable<int>(unlockedDate.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (requirement.present) {
      map['requirement'] = Variable<int>(requirement.value);
    }
    if (currentProgress.present) {
      map['current_progress'] = Variable<int>(currentProgress.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AchievementsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('icon: $icon, ')
          ..write('category: $category, ')
          ..write('points: $points, ')
          ..write('unlocked: $unlocked, ')
          ..write('unlockedDate: $unlockedDate, ')
          ..write('progress: $progress, ')
          ..write('requirement: $requirement, ')
          ..write('currentProgress: $currentProgress, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Quests extends Table with TableInfo<Quests, Quest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Quests(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
      'points', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _completedMeta =
      const VerificationMeta('completed');
  late final GeneratedColumn<int> completed = GeneratedColumn<int>(
      'completed', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  static const VerificationMeta _progressMeta =
      const VerificationMeta('progress');
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
      'progress', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT 0.0',
      defaultValue: const CustomExpression('0.0'));
  static const VerificationMeta _requirementMeta =
      const VerificationMeta('requirement');
  late final GeneratedColumn<int> requirement = GeneratedColumn<int>(
      'requirement', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, points, completed, progress, requirement];
  @override
  String get aliasedName => _alias ?? 'quests';
  @override
  String get actualTableName => 'quests';
  @override
  VerificationContext validateIntegrity(Insertable<Quest> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('points')) {
      context.handle(_pointsMeta,
          points.isAcceptableOrUnknown(data['points']!, _pointsMeta));
    } else if (isInserting) {
      context.missing(_pointsMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress']!, _progressMeta));
    }
    if (data.containsKey('requirement')) {
      context.handle(
          _requirementMeta,
          requirement.isAcceptableOrUnknown(
              data['requirement']!, _requirementMeta));
    } else if (isInserting) {
      context.missing(_requirementMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Quest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Quest(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      points: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}points'])!,
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}completed'])!,
      progress: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}progress'])!,
      requirement: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}requirement'])!,
    );
  }

  @override
  Quests createAlias(String alias) {
    return Quests(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Quest extends DataClass implements Insertable<Quest> {
  final String id;
  final String name;
  final String description;
  final int points;
  final int completed;
  final double progress;
  final int requirement;
  const Quest(
      {required this.id,
      required this.name,
      required this.description,
      required this.points,
      required this.completed,
      required this.progress,
      required this.requirement});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['points'] = Variable<int>(points);
    map['completed'] = Variable<int>(completed);
    map['progress'] = Variable<double>(progress);
    map['requirement'] = Variable<int>(requirement);
    return map;
  }

  QuestsCompanion toCompanion(bool nullToAbsent) {
    return QuestsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      points: Value(points),
      completed: Value(completed),
      progress: Value(progress),
      requirement: Value(requirement),
    );
  }

  factory Quest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Quest(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      points: serializer.fromJson<int>(json['points']),
      completed: serializer.fromJson<int>(json['completed']),
      progress: serializer.fromJson<double>(json['progress']),
      requirement: serializer.fromJson<int>(json['requirement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'points': serializer.toJson<int>(points),
      'completed': serializer.toJson<int>(completed),
      'progress': serializer.toJson<double>(progress),
      'requirement': serializer.toJson<int>(requirement),
    };
  }

  Quest copyWith(
          {String? id,
          String? name,
          String? description,
          int? points,
          int? completed,
          double? progress,
          int? requirement}) =>
      Quest(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        points: points ?? this.points,
        completed: completed ?? this.completed,
        progress: progress ?? this.progress,
        requirement: requirement ?? this.requirement,
      );
  @override
  String toString() {
    return (StringBuffer('Quest(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('points: $points, ')
          ..write('completed: $completed, ')
          ..write('progress: $progress, ')
          ..write('requirement: $requirement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, description, points, completed, progress, requirement);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Quest &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.points == this.points &&
          other.completed == this.completed &&
          other.progress == this.progress &&
          other.requirement == this.requirement);
}

class QuestsCompanion extends UpdateCompanion<Quest> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int> points;
  final Value<int> completed;
  final Value<double> progress;
  final Value<int> requirement;
  final Value<int> rowid;
  const QuestsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.points = const Value.absent(),
    this.completed = const Value.absent(),
    this.progress = const Value.absent(),
    this.requirement = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  QuestsCompanion.insert({
    required String id,
    required String name,
    required String description,
    required int points,
    this.completed = const Value.absent(),
    this.progress = const Value.absent(),
    required int requirement,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        description = Value(description),
        points = Value(points),
        requirement = Value(requirement);
  static Insertable<Quest> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? points,
    Expression<int>? completed,
    Expression<double>? progress,
    Expression<int>? requirement,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (points != null) 'points': points,
      if (completed != null) 'completed': completed,
      if (progress != null) 'progress': progress,
      if (requirement != null) 'requirement': requirement,
      if (rowid != null) 'rowid': rowid,
    });
  }

  QuestsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int>? points,
      Value<int>? completed,
      Value<double>? progress,
      Value<int>? requirement,
      Value<int>? rowid}) {
    return QuestsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      points: points ?? this.points,
      completed: completed ?? this.completed,
      progress: progress ?? this.progress,
      requirement: requirement ?? this.requirement,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    if (completed.present) {
      map['completed'] = Variable<int>(completed.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (requirement.present) {
      map['requirement'] = Variable<int>(requirement.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('points: $points, ')
          ..write('completed: $completed, ')
          ..write('progress: $progress, ')
          ..write('requirement: $requirement, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Leaderboard extends Table with TableInfo<Leaderboard, LeaderboardData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Leaderboard(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'PRIMARY KEY NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
      'points', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
      'level', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [userId, name, points, level];
  @override
  String get aliasedName => _alias ?? 'leaderboard';
  @override
  String get actualTableName => 'leaderboard';
  @override
  VerificationContext validateIntegrity(Insertable<LeaderboardData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('points')) {
      context.handle(_pointsMeta,
          points.isAcceptableOrUnknown(data['points']!, _pointsMeta));
    } else if (isInserting) {
      context.missing(_pointsMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  LeaderboardData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LeaderboardData(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      points: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}points'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])!,
    );
  }

  @override
  Leaderboard createAlias(String alias) {
    return Leaderboard(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class LeaderboardData extends DataClass implements Insertable<LeaderboardData> {
  final String userId;
  final String name;
  final int points;
  final int level;
  const LeaderboardData(
      {required this.userId,
      required this.name,
      required this.points,
      required this.level});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['name'] = Variable<String>(name);
    map['points'] = Variable<int>(points);
    map['level'] = Variable<int>(level);
    return map;
  }

  LeaderboardCompanion toCompanion(bool nullToAbsent) {
    return LeaderboardCompanion(
      userId: Value(userId),
      name: Value(name),
      points: Value(points),
      level: Value(level),
    );
  }

  factory LeaderboardData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LeaderboardData(
      userId: serializer.fromJson<String>(json['user_id']),
      name: serializer.fromJson<String>(json['name']),
      points: serializer.fromJson<int>(json['points']),
      level: serializer.fromJson<int>(json['level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'user_id': serializer.toJson<String>(userId),
      'name': serializer.toJson<String>(name),
      'points': serializer.toJson<int>(points),
      'level': serializer.toJson<int>(level),
    };
  }

  LeaderboardData copyWith(
          {String? userId, String? name, int? points, int? level}) =>
      LeaderboardData(
        userId: userId ?? this.userId,
        name: name ?? this.name,
        points: points ?? this.points,
        level: level ?? this.level,
      );
  @override
  String toString() {
    return (StringBuffer('LeaderboardData(')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('points: $points, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, name, points, level);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LeaderboardData &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.points == this.points &&
          other.level == this.level);
}

class LeaderboardCompanion extends UpdateCompanion<LeaderboardData> {
  final Value<String> userId;
  final Value<String> name;
  final Value<int> points;
  final Value<int> level;
  final Value<int> rowid;
  const LeaderboardCompanion({
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.points = const Value.absent(),
    this.level = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LeaderboardCompanion.insert({
    required String userId,
    required String name,
    required int points,
    required int level,
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        name = Value(name),
        points = Value(points),
        level = Value(level);
  static Insertable<LeaderboardData> custom({
    Expression<String>? userId,
    Expression<String>? name,
    Expression<int>? points,
    Expression<int>? level,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (points != null) 'points': points,
      if (level != null) 'level': level,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LeaderboardCompanion copyWith(
      {Value<String>? userId,
      Value<String>? name,
      Value<int>? points,
      Value<int>? level,
      Value<int>? rowid}) {
    return LeaderboardCompanion(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      points: points ?? this.points,
      level: level ?? this.level,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LeaderboardCompanion(')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('points: $points, ')
          ..write('level: $level, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class MessageTemplates extends Table
    with TableInfo<MessageTemplates, MessageTemplate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  MessageTemplates(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name, content, category];
  @override
  String get aliasedName => _alias ?? 'message_templates';
  @override
  String get actualTableName => 'message_templates';
  @override
  VerificationContext validateIntegrity(Insertable<MessageTemplate> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MessageTemplate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MessageTemplate(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
    );
  }

  @override
  MessageTemplates createAlias(String alias) {
    return MessageTemplates(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class MessageTemplate extends DataClass implements Insertable<MessageTemplate> {
  final int id;
  final String name;
  final String content;
  final String category;
  const MessageTemplate(
      {required this.id,
      required this.name,
      required this.content,
      required this.category});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['content'] = Variable<String>(content);
    map['category'] = Variable<String>(category);
    return map;
  }

  MessageTemplatesCompanion toCompanion(bool nullToAbsent) {
    return MessageTemplatesCompanion(
      id: Value(id),
      name: Value(name),
      content: Value(content),
      category: Value(category),
    );
  }

  factory MessageTemplate.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MessageTemplate(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      content: serializer.fromJson<String>(json['content']),
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'content': serializer.toJson<String>(content),
      'category': serializer.toJson<String>(category),
    };
  }

  MessageTemplate copyWith(
          {int? id, String? name, String? content, String? category}) =>
      MessageTemplate(
        id: id ?? this.id,
        name: name ?? this.name,
        content: content ?? this.content,
        category: category ?? this.category,
      );
  @override
  String toString() {
    return (StringBuffer('MessageTemplate(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('content: $content, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, content, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessageTemplate &&
          other.id == this.id &&
          other.name == this.name &&
          other.content == this.content &&
          other.category == this.category);
}

class MessageTemplatesCompanion extends UpdateCompanion<MessageTemplate> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> content;
  final Value<String> category;
  const MessageTemplatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.content = const Value.absent(),
    this.category = const Value.absent(),
  });
  MessageTemplatesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String content,
    required String category,
  })  : name = Value(name),
        content = Value(content),
        category = Value(category);
  static Insertable<MessageTemplate> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? content,
    Expression<String>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (content != null) 'content': content,
      if (category != null) 'category': category,
    });
  }

  MessageTemplatesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? content,
      Value<String>? category}) {
    return MessageTemplatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      content: content ?? this.content,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessageTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('content: $content, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

class UserSettings extends Table with TableInfo<UserSettings, UserSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserSettings(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'PRIMARY KEY AUTOINCREMENT NOT NULL');
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _timezoneMeta =
      const VerificationMeta('timezone');
  late final GeneratedColumn<String> timezone = GeneratedColumn<String>(
      'timezone', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _dateFormatMeta =
      const VerificationMeta('dateFormat');
  late final GeneratedColumn<String> dateFormat = GeneratedColumn<String>(
      'date_format', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _themeMeta = const VerificationMeta('theme');
  late final GeneratedColumn<String> theme = GeneratedColumn<String>(
      'theme', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _accentColorMeta =
      const VerificationMeta('accentColor');
  late final GeneratedColumn<int> accentColor = GeneratedColumn<int>(
      'accent_color', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _messageRemindersMeta =
      const VerificationMeta('messageReminders');
  late final GeneratedColumn<int> messageReminders = GeneratedColumn<int>(
      'message_reminders', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _birthdayRemindersMeta =
      const VerificationMeta('birthdayReminders');
  late final GeneratedColumn<int> birthdayReminders = GeneratedColumn<int>(
      'birthday_reminders', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _achievementNotificationsMeta =
      const VerificationMeta('achievementNotifications');
  late final GeneratedColumn<int> achievementNotifications =
      GeneratedColumn<int>('achievement_notifications', aliasedName, false,
          type: DriftSqlType.int,
          requiredDuringInsert: true,
          $customConstraints: 'NOT NULL');
  static const VerificationMeta _dailyQuestsMeta =
      const VerificationMeta('dailyQuests');
  late final GeneratedColumn<int> dailyQuests = GeneratedColumn<int>(
      'daily_quests', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _dataEncryptionMeta =
      const VerificationMeta('dataEncryption');
  late final GeneratedColumn<int> dataEncryption = GeneratedColumn<int>(
      'data_encryption', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _analyticsMeta =
      const VerificationMeta('analytics');
  late final GeneratedColumn<int> analytics = GeneratedColumn<int>(
      'analytics', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _autoLockMeta =
      const VerificationMeta('autoLock');
  late final GeneratedColumn<int> autoLock = GeneratedColumn<int>(
      'auto_lock', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        displayName,
        email,
        timezone,
        dateFormat,
        theme,
        accentColor,
        messageReminders,
        birthdayReminders,
        achievementNotifications,
        dailyQuests,
        dataEncryption,
        analytics,
        autoLock
      ];
  @override
  String get aliasedName => _alias ?? 'user_settings';
  @override
  String get actualTableName => 'user_settings';
  @override
  VerificationContext validateIntegrity(Insertable<UserSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('timezone')) {
      context.handle(_timezoneMeta,
          timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta));
    } else if (isInserting) {
      context.missing(_timezoneMeta);
    }
    if (data.containsKey('date_format')) {
      context.handle(
          _dateFormatMeta,
          dateFormat.isAcceptableOrUnknown(
              data['date_format']!, _dateFormatMeta));
    } else if (isInserting) {
      context.missing(_dateFormatMeta);
    }
    if (data.containsKey('theme')) {
      context.handle(
          _themeMeta, theme.isAcceptableOrUnknown(data['theme']!, _themeMeta));
    } else if (isInserting) {
      context.missing(_themeMeta);
    }
    if (data.containsKey('accent_color')) {
      context.handle(
          _accentColorMeta,
          accentColor.isAcceptableOrUnknown(
              data['accent_color']!, _accentColorMeta));
    } else if (isInserting) {
      context.missing(_accentColorMeta);
    }
    if (data.containsKey('message_reminders')) {
      context.handle(
          _messageRemindersMeta,
          messageReminders.isAcceptableOrUnknown(
              data['message_reminders']!, _messageRemindersMeta));
    } else if (isInserting) {
      context.missing(_messageRemindersMeta);
    }
    if (data.containsKey('birthday_reminders')) {
      context.handle(
          _birthdayRemindersMeta,
          birthdayReminders.isAcceptableOrUnknown(
              data['birthday_reminders']!, _birthdayRemindersMeta));
    } else if (isInserting) {
      context.missing(_birthdayRemindersMeta);
    }
    if (data.containsKey('achievement_notifications')) {
      context.handle(
          _achievementNotificationsMeta,
          achievementNotifications.isAcceptableOrUnknown(
              data['achievement_notifications']!,
              _achievementNotificationsMeta));
    } else if (isInserting) {
      context.missing(_achievementNotificationsMeta);
    }
    if (data.containsKey('daily_quests')) {
      context.handle(
          _dailyQuestsMeta,
          dailyQuests.isAcceptableOrUnknown(
              data['daily_quests']!, _dailyQuestsMeta));
    } else if (isInserting) {
      context.missing(_dailyQuestsMeta);
    }
    if (data.containsKey('data_encryption')) {
      context.handle(
          _dataEncryptionMeta,
          dataEncryption.isAcceptableOrUnknown(
              data['data_encryption']!, _dataEncryptionMeta));
    } else if (isInserting) {
      context.missing(_dataEncryptionMeta);
    }
    if (data.containsKey('analytics')) {
      context.handle(_analyticsMeta,
          analytics.isAcceptableOrUnknown(data['analytics']!, _analyticsMeta));
    } else if (isInserting) {
      context.missing(_analyticsMeta);
    }
    if (data.containsKey('auto_lock')) {
      context.handle(_autoLockMeta,
          autoLock.isAcceptableOrUnknown(data['auto_lock']!, _autoLockMeta));
    } else if (isInserting) {
      context.missing(_autoLockMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserSetting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      timezone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}timezone'])!,
      dateFormat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date_format'])!,
      theme: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme'])!,
      accentColor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}accent_color'])!,
      messageReminders: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}message_reminders'])!,
      birthdayReminders: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}birthday_reminders'])!,
      achievementNotifications: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}achievement_notifications'])!,
      dailyQuests: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}daily_quests'])!,
      dataEncryption: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}data_encryption'])!,
      analytics: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}analytics'])!,
      autoLock: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}auto_lock'])!,
    );
  }

  @override
  UserSettings createAlias(String alias) {
    return UserSettings(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class UserSetting extends DataClass implements Insertable<UserSetting> {
  final int id;
  final String displayName;
  final String email;
  final String timezone;
  final String dateFormat;
  final String theme;
  final int accentColor;
  final int messageReminders;
  final int birthdayReminders;
  final int achievementNotifications;
  final int dailyQuests;
  final int dataEncryption;
  final int analytics;
  final int autoLock;
  const UserSetting(
      {required this.id,
      required this.displayName,
      required this.email,
      required this.timezone,
      required this.dateFormat,
      required this.theme,
      required this.accentColor,
      required this.messageReminders,
      required this.birthdayReminders,
      required this.achievementNotifications,
      required this.dailyQuests,
      required this.dataEncryption,
      required this.analytics,
      required this.autoLock});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['display_name'] = Variable<String>(displayName);
    map['email'] = Variable<String>(email);
    map['timezone'] = Variable<String>(timezone);
    map['date_format'] = Variable<String>(dateFormat);
    map['theme'] = Variable<String>(theme);
    map['accent_color'] = Variable<int>(accentColor);
    map['message_reminders'] = Variable<int>(messageReminders);
    map['birthday_reminders'] = Variable<int>(birthdayReminders);
    map['achievement_notifications'] = Variable<int>(achievementNotifications);
    map['daily_quests'] = Variable<int>(dailyQuests);
    map['data_encryption'] = Variable<int>(dataEncryption);
    map['analytics'] = Variable<int>(analytics);
    map['auto_lock'] = Variable<int>(autoLock);
    return map;
  }

  UserSettingsCompanion toCompanion(bool nullToAbsent) {
    return UserSettingsCompanion(
      id: Value(id),
      displayName: Value(displayName),
      email: Value(email),
      timezone: Value(timezone),
      dateFormat: Value(dateFormat),
      theme: Value(theme),
      accentColor: Value(accentColor),
      messageReminders: Value(messageReminders),
      birthdayReminders: Value(birthdayReminders),
      achievementNotifications: Value(achievementNotifications),
      dailyQuests: Value(dailyQuests),
      dataEncryption: Value(dataEncryption),
      analytics: Value(analytics),
      autoLock: Value(autoLock),
    );
  }

  factory UserSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserSetting(
      id: serializer.fromJson<int>(json['id']),
      displayName: serializer.fromJson<String>(json['display_name']),
      email: serializer.fromJson<String>(json['email']),
      timezone: serializer.fromJson<String>(json['timezone']),
      dateFormat: serializer.fromJson<String>(json['date_format']),
      theme: serializer.fromJson<String>(json['theme']),
      accentColor: serializer.fromJson<int>(json['accent_color']),
      messageReminders: serializer.fromJson<int>(json['message_reminders']),
      birthdayReminders: serializer.fromJson<int>(json['birthday_reminders']),
      achievementNotifications:
          serializer.fromJson<int>(json['achievement_notifications']),
      dailyQuests: serializer.fromJson<int>(json['daily_quests']),
      dataEncryption: serializer.fromJson<int>(json['data_encryption']),
      analytics: serializer.fromJson<int>(json['analytics']),
      autoLock: serializer.fromJson<int>(json['auto_lock']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'display_name': serializer.toJson<String>(displayName),
      'email': serializer.toJson<String>(email),
      'timezone': serializer.toJson<String>(timezone),
      'date_format': serializer.toJson<String>(dateFormat),
      'theme': serializer.toJson<String>(theme),
      'accent_color': serializer.toJson<int>(accentColor),
      'message_reminders': serializer.toJson<int>(messageReminders),
      'birthday_reminders': serializer.toJson<int>(birthdayReminders),
      'achievement_notifications':
          serializer.toJson<int>(achievementNotifications),
      'daily_quests': serializer.toJson<int>(dailyQuests),
      'data_encryption': serializer.toJson<int>(dataEncryption),
      'analytics': serializer.toJson<int>(analytics),
      'auto_lock': serializer.toJson<int>(autoLock),
    };
  }

  UserSetting copyWith(
          {int? id,
          String? displayName,
          String? email,
          String? timezone,
          String? dateFormat,
          String? theme,
          int? accentColor,
          int? messageReminders,
          int? birthdayReminders,
          int? achievementNotifications,
          int? dailyQuests,
          int? dataEncryption,
          int? analytics,
          int? autoLock}) =>
      UserSetting(
        id: id ?? this.id,
        displayName: displayName ?? this.displayName,
        email: email ?? this.email,
        timezone: timezone ?? this.timezone,
        dateFormat: dateFormat ?? this.dateFormat,
        theme: theme ?? this.theme,
        accentColor: accentColor ?? this.accentColor,
        messageReminders: messageReminders ?? this.messageReminders,
        birthdayReminders: birthdayReminders ?? this.birthdayReminders,
        achievementNotifications:
            achievementNotifications ?? this.achievementNotifications,
        dailyQuests: dailyQuests ?? this.dailyQuests,
        dataEncryption: dataEncryption ?? this.dataEncryption,
        analytics: analytics ?? this.analytics,
        autoLock: autoLock ?? this.autoLock,
      );
  @override
  String toString() {
    return (StringBuffer('UserSetting(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('email: $email, ')
          ..write('timezone: $timezone, ')
          ..write('dateFormat: $dateFormat, ')
          ..write('theme: $theme, ')
          ..write('accentColor: $accentColor, ')
          ..write('messageReminders: $messageReminders, ')
          ..write('birthdayReminders: $birthdayReminders, ')
          ..write('achievementNotifications: $achievementNotifications, ')
          ..write('dailyQuests: $dailyQuests, ')
          ..write('dataEncryption: $dataEncryption, ')
          ..write('analytics: $analytics, ')
          ..write('autoLock: $autoLock')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      displayName,
      email,
      timezone,
      dateFormat,
      theme,
      accentColor,
      messageReminders,
      birthdayReminders,
      achievementNotifications,
      dailyQuests,
      dataEncryption,
      analytics,
      autoLock);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserSetting &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.email == this.email &&
          other.timezone == this.timezone &&
          other.dateFormat == this.dateFormat &&
          other.theme == this.theme &&
          other.accentColor == this.accentColor &&
          other.messageReminders == this.messageReminders &&
          other.birthdayReminders == this.birthdayReminders &&
          other.achievementNotifications == this.achievementNotifications &&
          other.dailyQuests == this.dailyQuests &&
          other.dataEncryption == this.dataEncryption &&
          other.analytics == this.analytics &&
          other.autoLock == this.autoLock);
}

class UserSettingsCompanion extends UpdateCompanion<UserSetting> {
  final Value<int> id;
  final Value<String> displayName;
  final Value<String> email;
  final Value<String> timezone;
  final Value<String> dateFormat;
  final Value<String> theme;
  final Value<int> accentColor;
  final Value<int> messageReminders;
  final Value<int> birthdayReminders;
  final Value<int> achievementNotifications;
  final Value<int> dailyQuests;
  final Value<int> dataEncryption;
  final Value<int> analytics;
  final Value<int> autoLock;
  const UserSettingsCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.email = const Value.absent(),
    this.timezone = const Value.absent(),
    this.dateFormat = const Value.absent(),
    this.theme = const Value.absent(),
    this.accentColor = const Value.absent(),
    this.messageReminders = const Value.absent(),
    this.birthdayReminders = const Value.absent(),
    this.achievementNotifications = const Value.absent(),
    this.dailyQuests = const Value.absent(),
    this.dataEncryption = const Value.absent(),
    this.analytics = const Value.absent(),
    this.autoLock = const Value.absent(),
  });
  UserSettingsCompanion.insert({
    this.id = const Value.absent(),
    required String displayName,
    required String email,
    required String timezone,
    required String dateFormat,
    required String theme,
    required int accentColor,
    required int messageReminders,
    required int birthdayReminders,
    required int achievementNotifications,
    required int dailyQuests,
    required int dataEncryption,
    required int analytics,
    required int autoLock,
  })  : displayName = Value(displayName),
        email = Value(email),
        timezone = Value(timezone),
        dateFormat = Value(dateFormat),
        theme = Value(theme),
        accentColor = Value(accentColor),
        messageReminders = Value(messageReminders),
        birthdayReminders = Value(birthdayReminders),
        achievementNotifications = Value(achievementNotifications),
        dailyQuests = Value(dailyQuests),
        dataEncryption = Value(dataEncryption),
        analytics = Value(analytics),
        autoLock = Value(autoLock);
  static Insertable<UserSetting> custom({
    Expression<int>? id,
    Expression<String>? displayName,
    Expression<String>? email,
    Expression<String>? timezone,
    Expression<String>? dateFormat,
    Expression<String>? theme,
    Expression<int>? accentColor,
    Expression<int>? messageReminders,
    Expression<int>? birthdayReminders,
    Expression<int>? achievementNotifications,
    Expression<int>? dailyQuests,
    Expression<int>? dataEncryption,
    Expression<int>? analytics,
    Expression<int>? autoLock,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (email != null) 'email': email,
      if (timezone != null) 'timezone': timezone,
      if (dateFormat != null) 'date_format': dateFormat,
      if (theme != null) 'theme': theme,
      if (accentColor != null) 'accent_color': accentColor,
      if (messageReminders != null) 'message_reminders': messageReminders,
      if (birthdayReminders != null) 'birthday_reminders': birthdayReminders,
      if (achievementNotifications != null)
        'achievement_notifications': achievementNotifications,
      if (dailyQuests != null) 'daily_quests': dailyQuests,
      if (dataEncryption != null) 'data_encryption': dataEncryption,
      if (analytics != null) 'analytics': analytics,
      if (autoLock != null) 'auto_lock': autoLock,
    });
  }

  UserSettingsCompanion copyWith(
      {Value<int>? id,
      Value<String>? displayName,
      Value<String>? email,
      Value<String>? timezone,
      Value<String>? dateFormat,
      Value<String>? theme,
      Value<int>? accentColor,
      Value<int>? messageReminders,
      Value<int>? birthdayReminders,
      Value<int>? achievementNotifications,
      Value<int>? dailyQuests,
      Value<int>? dataEncryption,
      Value<int>? analytics,
      Value<int>? autoLock}) {
    return UserSettingsCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      timezone: timezone ?? this.timezone,
      dateFormat: dateFormat ?? this.dateFormat,
      theme: theme ?? this.theme,
      accentColor: accentColor ?? this.accentColor,
      messageReminders: messageReminders ?? this.messageReminders,
      birthdayReminders: birthdayReminders ?? this.birthdayReminders,
      achievementNotifications:
          achievementNotifications ?? this.achievementNotifications,
      dailyQuests: dailyQuests ?? this.dailyQuests,
      dataEncryption: dataEncryption ?? this.dataEncryption,
      analytics: analytics ?? this.analytics,
      autoLock: autoLock ?? this.autoLock,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (dateFormat.present) {
      map['date_format'] = Variable<String>(dateFormat.value);
    }
    if (theme.present) {
      map['theme'] = Variable<String>(theme.value);
    }
    if (accentColor.present) {
      map['accent_color'] = Variable<int>(accentColor.value);
    }
    if (messageReminders.present) {
      map['message_reminders'] = Variable<int>(messageReminders.value);
    }
    if (birthdayReminders.present) {
      map['birthday_reminders'] = Variable<int>(birthdayReminders.value);
    }
    if (achievementNotifications.present) {
      map['achievement_notifications'] =
          Variable<int>(achievementNotifications.value);
    }
    if (dailyQuests.present) {
      map['daily_quests'] = Variable<int>(dailyQuests.value);
    }
    if (dataEncryption.present) {
      map['data_encryption'] = Variable<int>(dataEncryption.value);
    }
    if (analytics.present) {
      map['analytics'] = Variable<int>(analytics.value);
    }
    if (autoLock.present) {
      map['auto_lock'] = Variable<int>(autoLock.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingsCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('email: $email, ')
          ..write('timezone: $timezone, ')
          ..write('dateFormat: $dateFormat, ')
          ..write('theme: $theme, ')
          ..write('accentColor: $accentColor, ')
          ..write('messageReminders: $messageReminders, ')
          ..write('birthdayReminders: $birthdayReminders, ')
          ..write('achievementNotifications: $achievementNotifications, ')
          ..write('dailyQuests: $dailyQuests, ')
          ..write('dataEncryption: $dataEncryption, ')
          ..write('analytics: $analytics, ')
          ..write('autoLock: $autoLock')
          ..write(')'))
        .toString();
  }
}

abstract class _$DatabaseImpl extends GeneratedDatabase {
  _$DatabaseImpl(QueryExecutor e) : super(e);
  _$DatabaseImpl.connect(DatabaseConnection c) : super.connect(c);
  late final Mementos mementos = Mementos(this);
  late final MementoEntries mementoEntries = MementoEntries(this);
  late final Trigger mementosInsert = Trigger(
      'CREATE TRIGGER mementos_insert AFTER INSERT ON mementos BEGIN INSERT INTO memento_entries ("rowid", name, context, company) VALUES (new.id, new.name, new.context, new.company);END',
      'mementos_insert');
  late final Trigger mementosDelete = Trigger(
      'CREATE TRIGGER mementos_delete AFTER DELETE ON mementos BEGIN INSERT INTO memento_entries (memento_entries, "rowid", name, context, company) VALUES (\'delete\', old.id, old.name, old.context, old.company);END',
      'mementos_delete');
  late final Trigger mementosUpdate = Trigger(
      'CREATE TRIGGER mementos_update AFTER UPDATE ON mementos BEGIN INSERT INTO memento_entries (memento_entries, "rowid", name, context, company) VALUES (\'delete\', new.id, new.name, new.context, new.company);INSERT INTO memento_entries ("rowid", name, context, company) VALUES (new.id, new.name, new.context, new.company);END',
      'mementos_update');
  late final Labels labels = Labels(this);
  late final MementoLabels mementoLabels = MementoLabels(this);
  late final Notes notes = Notes(this);
  late final ScheduledMessages scheduledMessages = ScheduledMessages(this);
  late final Achievements achievements = Achievements(this);
  late final Quests quests = Quests(this);
  late final Leaderboard leaderboard = Leaderboard(this);
  late final MessageTemplates messageTemplates = MessageTemplates(this);
  late final UserSettings userSettings = UserSettings(this);
  Selectable<SearchMementosResult> _searchMementos(String query) {
    return customSelect(
        'SELECT"result"."id" AS "nested_0.id", "result"."name" AS "nested_0.name", "result"."photo" AS "nested_0.photo", "result"."email" AS "nested_0.email", "result"."phone" AS "nested_0.phone", "result"."context" AS "nested_0.context", "result"."job_title" AS "nested_0.job_title", "result"."company" AS "nested_0.company", "result"."birthday" AS "nested_0.birthday" FROM memento_entries INNER JOIN mementos AS result ON result.id = memento_entries."rowid" WHERE memento_entries MATCH ?1 ORDER BY rank',
        variables: [
          Variable<String>(query)
        ],
        readsFrom: {
          mementoEntries,
          mementos,
        }).asyncMap((QueryRow row) async {
      return SearchMementosResult(
        result: await mementos.mapFromRow(row, tablePrefix: 'nested_0'),
      );
    });
  }

  Selectable<Memento> _getMementos() {
    return customSelect('SELECT * FROM mementos', variables: [], readsFrom: {
      mementos,
    }).asyncMap(mementos.mapFromRow);
  }

  Selectable<Memento> _getMementoById(int id) {
    return customSelect('SELECT * FROM mementos WHERE id = ?1 LIMIT 1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          mementos,
        }).asyncMap(mementos.mapFromRow);
  }

  Future<int> _insertMemento(
      String name,
      String? photo,
      String? email,
      String? phone,
      String? context,
      String? jobTitle,
      String? company,
      int? birthday) {
    return customInsert(
      'INSERT INTO mementos (name, photo, email, phone, context, job_title, company, birthday) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8)',
      variables: [
        Variable<String>(name),
        Variable<String>(photo),
        Variable<String>(email),
        Variable<String>(phone),
        Variable<String>(context),
        Variable<String>(jobTitle),
        Variable<String>(company),
        Variable<int>(birthday)
      ],
      updates: {mementos},
    );
  }

  Future<int> _updateMemento(
      String name,
      String? photo,
      String? email,
      String? phone,
      String? context,
      String? jobTitle,
      String? company,
      int? birthday,
      int id) {
    return customUpdate(
      'UPDATE mementos SET name = ?1, photo = ?2, email = ?3, phone = ?4, context = ?5, job_title = ?6, company = ?7, birthday = ?8 WHERE id = ?9',
      variables: [
        Variable<String>(name),
        Variable<String>(photo),
        Variable<String>(email),
        Variable<String>(phone),
        Variable<String>(context),
        Variable<String>(jobTitle),
        Variable<String>(company),
        Variable<int>(birthday),
        Variable<int>(id)
      ],
      updates: {mementos},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> _deleteMemento(int id) {
    return customUpdate(
      'DELETE FROM mementos WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {mementos},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> _deleteAllMementos() {
    return customUpdate(
      'DELETE FROM mementos',
      variables: [],
      updates: {mementos},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<Label> _getLabels() {
    return customSelect('SELECT * FROM labels', variables: [], readsFrom: {
      labels,
    }).asyncMap(labels.mapFromRow);
  }

  Selectable<Label> _getLabelById(int id) {
    return customSelect('SELECT * FROM labels WHERE id = ?1 LIMIT 1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          labels,
        }).asyncMap(labels.mapFromRow);
  }

  Future<int> _insertLabel(String name, int color) {
    return customInsert(
      'INSERT INTO labels (name, color) VALUES (?1, ?2)',
      variables: [Variable<String>(name), Variable<int>(color)],
      updates: {labels},
    );
  }

  Future<int> _updateLabel(String name, int color, int id) {
    return customUpdate(
      'UPDATE labels SET name = ?1, color = ?2 WHERE id = ?3',
      variables: [
        Variable<String>(name),
        Variable<int>(color),
        Variable<int>(id)
      ],
      updates: {labels},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> _deleteLabel(int id) {
    return customUpdate(
      'DELETE FROM labels WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {labels},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<Label> _getLabelsForMemento(int mementoId) {
    return customSelect(
        'SELECT l.* FROM labels AS l INNER JOIN memento_labels AS ml ON ml.label_id = l.id WHERE ml.memento_id = ?1',
        variables: [
          Variable<int>(mementoId)
        ],
        readsFrom: {
          labels,
          mementoLabels,
        }).asyncMap(labels.mapFromRow);
  }

  Future<int> _addLabelToMemento(int mementoId, int labelId) {
    return customInsert(
      'INSERT INTO memento_labels (memento_id, label_id) VALUES (?1, ?2)',
      variables: [Variable<int>(mementoId), Variable<int>(labelId)],
      updates: {mementoLabels},
    );
  }

  Future<int> _removeLabelFromMemento(int mementoId, int labelId) {
    return customUpdate(
      'DELETE FROM memento_labels WHERE memento_id = ?1 AND label_id = ?2',
      variables: [Variable<int>(mementoId), Variable<int>(labelId)],
      updates: {mementoLabels},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<Note> _getNotes() {
    return customSelect('SELECT * FROM notes', variables: [], readsFrom: {
      notes,
    }).asyncMap(notes.mapFromRow);
  }

  Selectable<Note> _getNoteById(int id) {
    return customSelect('SELECT * FROM notes WHERE id = ?1 LIMIT 1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          notes,
        }).asyncMap(notes.mapFromRow);
  }

  Selectable<Note> _getNotesForMemento(int mementoId) {
    return customSelect(
        'SELECT * FROM notes WHERE memento_id = ?1 ORDER BY is_favorite DESC, created_at DESC',
        variables: [
          Variable<int>(mementoId)
        ],
        readsFrom: {
          notes,
        }).asyncMap(notes.mapFromRow);
  }

  Future<int> _insertNote(int mementoId, String content, int createdAt,
      int? updatedAt, int isFavorite) {
    return customInsert(
      'INSERT INTO notes (memento_id, content, created_at, updated_at, is_favorite) VALUES (?1, ?2, ?3, ?4, ?5)',
      variables: [
        Variable<int>(mementoId),
        Variable<String>(content),
        Variable<int>(createdAt),
        Variable<int>(updatedAt),
        Variable<int>(isFavorite)
      ],
      updates: {notes},
    );
  }

  Future<int> _updateNote(
      String content, int? updatedAt, int isFavorite, int id) {
    return customUpdate(
      'UPDATE notes SET content = ?1, updated_at = ?2, is_favorite = ?3 WHERE id = ?4',
      variables: [
        Variable<String>(content),
        Variable<int>(updatedAt),
        Variable<int>(isFavorite),
        Variable<int>(id)
      ],
      updates: {notes},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> _deleteNote(int id) {
    return customUpdate(
      'DELETE FROM notes WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {notes},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<ScheduledMessage> _getScheduledMessages() {
    return customSelect(
        'SELECT * FROM scheduled_messages ORDER BY scheduled_date_time ASC',
        variables: [],
        readsFrom: {
          scheduledMessages,
        }).asyncMap(scheduledMessages.mapFromRow);
  }

  Selectable<ScheduledMessage> _getScheduledMessageById(int id) {
    return customSelect(
        'SELECT * FROM scheduled_messages WHERE id = ?1 LIMIT 1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          scheduledMessages,
        }).asyncMap(scheduledMessages.mapFromRow);
  }

  Selectable<ScheduledMessage> _getScheduledMessagesForMemento(int mementoId) {
    return customSelect(
        'SELECT * FROM scheduled_messages WHERE memento_id = ?1 ORDER BY scheduled_date_time ASC',
        variables: [
          Variable<int>(mementoId)
        ],
        readsFrom: {
          scheduledMessages,
        }).asyncMap(scheduledMessages.mapFromRow);
  }

  Selectable<ScheduledMessage> _getActiveScheduledMessages() {
    return customSelect(
        'SELECT * FROM scheduled_messages WHERE is_active = 1 ORDER BY scheduled_date_time ASC',
        variables: [],
        readsFrom: {
          scheduledMessages,
        }).asyncMap(scheduledMessages.mapFromRow);
  }

  Selectable<ScheduledMessage> _getDueScheduledMessages(int currentTime) {
    return customSelect(
        'SELECT * FROM scheduled_messages WHERE scheduled_date_time <= ?1 AND is_active = 1 AND sent_at IS NULL ORDER BY scheduled_date_time ASC',
        variables: [
          Variable<int>(currentTime)
        ],
        readsFrom: {
          scheduledMessages,
        }).asyncMap(scheduledMessages.mapFromRow);
  }

  Future<int> _insertScheduledMessage(
      int mementoId,
      String messageType,
      String title,
      String content,
      int scheduledDateTime,
      int isActive,
      int createdAt,
      int? sentAt) {
    return customInsert(
      'INSERT INTO scheduled_messages (memento_id, message_type, title, content, scheduled_date_time, is_active, created_at, sent_at) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8)',
      variables: [
        Variable<int>(mementoId),
        Variable<String>(messageType),
        Variable<String>(title),
        Variable<String>(content),
        Variable<int>(scheduledDateTime),
        Variable<int>(isActive),
        Variable<int>(createdAt),
        Variable<int>(sentAt)
      ],
      updates: {scheduledMessages},
    );
  }

  Future<int> _updateScheduledMessage(
      int mementoId,
      String messageType,
      String title,
      String content,
      int scheduledDateTime,
      int isActive,
      int? sentAt,
      int id) {
    return customUpdate(
      'UPDATE scheduled_messages SET memento_id = ?1, message_type = ?2, title = ?3, content = ?4, scheduled_date_time = ?5, is_active = ?6, sent_at = ?7 WHERE id = ?8',
      variables: [
        Variable<int>(mementoId),
        Variable<String>(messageType),
        Variable<String>(title),
        Variable<String>(content),
        Variable<int>(scheduledDateTime),
        Variable<int>(isActive),
        Variable<int>(sentAt),
        Variable<int>(id)
      ],
      updates: {scheduledMessages},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> _deleteScheduledMessage(int id) {
    return customUpdate(
      'DELETE FROM scheduled_messages WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {scheduledMessages},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> _markScheduledMessageAsSent(int? sentAt, int id) {
    return customUpdate(
      'UPDATE scheduled_messages SET sent_at = ?1 WHERE id = ?2',
      variables: [Variable<int>(sentAt), Variable<int>(id)],
      updates: {scheduledMessages},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<Achievement> _getAchievements() {
    return customSelect('SELECT * FROM achievements',
        variables: [],
        readsFrom: {
          achievements,
        }).asyncMap(achievements.mapFromRow);
  }

  Selectable<Achievement> _getAchievementById(String id) {
    return customSelect('SELECT * FROM achievements WHERE id = ?1 LIMIT 1',
        variables: [
          Variable<String>(id)
        ],
        readsFrom: {
          achievements,
        }).asyncMap(achievements.mapFromRow);
  }

  Future<int> _insertAchievement(
      String id,
      String name,
      String description,
      String icon,
      String category,
      int points,
      int unlocked,
      int? unlockedDate,
      double progress,
      int requirement,
      int currentProgress) {
    return customInsert(
      'INSERT INTO achievements (id, name, description, icon, category, points, unlocked, unlocked_date, progress, requirement, current_progress) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11)',
      variables: [
        Variable<String>(id),
        Variable<String>(name),
        Variable<String>(description),
        Variable<String>(icon),
        Variable<String>(category),
        Variable<int>(points),
        Variable<int>(unlocked),
        Variable<int>(unlockedDate),
        Variable<double>(progress),
        Variable<int>(requirement),
        Variable<int>(currentProgress)
      ],
      updates: {achievements},
    );
  }

  Future<int> _updateAchievement(
      String name,
      String description,
      String icon,
      String category,
      int points,
      int unlocked,
      int? unlockedDate,
      double progress,
      int requirement,
      int currentProgress,
      String id) {
    return customUpdate(
      'UPDATE achievements SET name = ?1, description = ?2, icon = ?3, category = ?4, points = ?5, unlocked = ?6, unlocked_date = ?7, progress = ?8, requirement = ?9, current_progress = ?10 WHERE id = ?11',
      variables: [
        Variable<String>(name),
        Variable<String>(description),
        Variable<String>(icon),
        Variable<String>(category),
        Variable<int>(points),
        Variable<int>(unlocked),
        Variable<int>(unlockedDate),
        Variable<double>(progress),
        Variable<int>(requirement),
        Variable<int>(currentProgress),
        Variable<String>(id)
      ],
      updates: {achievements},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<Quest> _getQuests() {
    return customSelect('SELECT * FROM quests', variables: [], readsFrom: {
      quests,
    }).asyncMap(quests.mapFromRow);
  }

  Selectable<Quest> _getQuestById(String id) {
    return customSelect('SELECT * FROM quests WHERE id = ?1 LIMIT 1',
        variables: [
          Variable<String>(id)
        ],
        readsFrom: {
          quests,
        }).asyncMap(quests.mapFromRow);
  }

  Future<int> _insertQuest(String id, String name, String description,
      int points, int completed, double progress, int requirement) {
    return customInsert(
      'INSERT INTO quests (id, name, description, points, completed, progress, requirement) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7)',
      variables: [
        Variable<String>(id),
        Variable<String>(name),
        Variable<String>(description),
        Variable<int>(points),
        Variable<int>(completed),
        Variable<double>(progress),
        Variable<int>(requirement)
      ],
      updates: {quests},
    );
  }

  Future<int> _updateQuest(String name, String description, int points,
      int completed, double progress, int requirement, String id) {
    return customUpdate(
      'UPDATE quests SET name = ?1, description = ?2, points = ?3, completed = ?4, progress = ?5, requirement = ?6 WHERE id = ?7',
      variables: [
        Variable<String>(name),
        Variable<String>(description),
        Variable<int>(points),
        Variable<int>(completed),
        Variable<double>(progress),
        Variable<int>(requirement),
        Variable<String>(id)
      ],
      updates: {quests},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<LeaderboardData> _getLeaderboard() {
    return customSelect('SELECT * FROM leaderboard ORDER BY points DESC',
        variables: [],
        readsFrom: {
          leaderboard,
        }).asyncMap(leaderboard.mapFromRow);
  }

  Selectable<LeaderboardData> _getLeaderboardEntry(String userId) {
    return customSelect('SELECT * FROM leaderboard WHERE user_id = ?1 LIMIT 1',
        variables: [
          Variable<String>(userId)
        ],
        readsFrom: {
          leaderboard,
        }).asyncMap(leaderboard.mapFromRow);
  }

  Future<int> _insertLeaderboardEntry(
      String userId, String name, int points, int level) {
    return customInsert(
      'INSERT INTO leaderboard (user_id, name, points, level) VALUES (?1, ?2, ?3, ?4)',
      variables: [
        Variable<String>(userId),
        Variable<String>(name),
        Variable<int>(points),
        Variable<int>(level)
      ],
      updates: {leaderboard},
    );
  }

  Future<int> _updateLeaderboardEntry(
      String name, int points, int level, String userId) {
    return customUpdate(
      'UPDATE leaderboard SET name = ?1, points = ?2, level = ?3 WHERE user_id = ?4',
      variables: [
        Variable<String>(name),
        Variable<int>(points),
        Variable<int>(level),
        Variable<String>(userId)
      ],
      updates: {leaderboard},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<MessageTemplate> _getMessageTemplates() {
    return customSelect('SELECT * FROM message_templates',
        variables: [],
        readsFrom: {
          messageTemplates,
        }).asyncMap(messageTemplates.mapFromRow);
  }

  Selectable<MessageTemplate> _getMessageTemplateById(int id) {
    return customSelect('SELECT * FROM message_templates WHERE id = ?1 LIMIT 1',
        variables: [
          Variable<int>(id)
        ],
        readsFrom: {
          messageTemplates,
        }).asyncMap(messageTemplates.mapFromRow);
  }

  Future<int> _insertMessageTemplate(
      String name, String content, String category) {
    return customInsert(
      'INSERT INTO message_templates (name, content, category) VALUES (?1, ?2, ?3)',
      variables: [
        Variable<String>(name),
        Variable<String>(content),
        Variable<String>(category)
      ],
      updates: {messageTemplates},
    );
  }

  Future<int> _updateMessageTemplate(
      String name, String content, String category, int id) {
    return customUpdate(
      'UPDATE message_templates SET name = ?1, content = ?2, category = ?3 WHERE id = ?4',
      variables: [
        Variable<String>(name),
        Variable<String>(content),
        Variable<String>(category),
        Variable<int>(id)
      ],
      updates: {messageTemplates},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> _deleteMessageTemplate(int id) {
    return customUpdate(
      'DELETE FROM message_templates WHERE id = ?1',
      variables: [Variable<int>(id)],
      updates: {messageTemplates},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<UserSetting> _getUserSettings() {
    return customSelect('SELECT * FROM user_settings LIMIT 1',
        variables: [],
        readsFrom: {
          userSettings,
        }).asyncMap(userSettings.mapFromRow);
  }

  Future<int> _insertUserSettings(
      String displayName,
      String email,
      String timezone,
      String dateFormat,
      String theme,
      int accentColor,
      int messageReminders,
      int birthdayReminders,
      int achievementNotifications,
      int dailyQuests,
      int dataEncryption,
      int analytics,
      int autoLock) {
    return customInsert(
      'INSERT INTO user_settings (display_name, email, timezone, date_format, theme, accent_color, message_reminders, birthday_reminders, achievement_notifications, daily_quests, data_encryption, analytics, auto_lock) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11, ?12, ?13)',
      variables: [
        Variable<String>(displayName),
        Variable<String>(email),
        Variable<String>(timezone),
        Variable<String>(dateFormat),
        Variable<String>(theme),
        Variable<int>(accentColor),
        Variable<int>(messageReminders),
        Variable<int>(birthdayReminders),
        Variable<int>(achievementNotifications),
        Variable<int>(dailyQuests),
        Variable<int>(dataEncryption),
        Variable<int>(analytics),
        Variable<int>(autoLock)
      ],
      updates: {userSettings},
    );
  }

  Future<int> _updateUserSettings(
      String displayName,
      String email,
      String timezone,
      String dateFormat,
      String theme,
      int accentColor,
      int messageReminders,
      int birthdayReminders,
      int achievementNotifications,
      int dailyQuests,
      int dataEncryption,
      int analytics,
      int autoLock,
      int id) {
    return customUpdate(
      'UPDATE user_settings SET display_name = ?1, email = ?2, timezone = ?3, date_format = ?4, theme = ?5, accent_color = ?6, message_reminders = ?7, birthday_reminders = ?8, achievement_notifications = ?9, daily_quests = ?10, data_encryption = ?11, analytics = ?12, auto_lock = ?13 WHERE id = ?14',
      variables: [
        Variable<String>(displayName),
        Variable<String>(email),
        Variable<String>(timezone),
        Variable<String>(dateFormat),
        Variable<String>(theme),
        Variable<int>(accentColor),
        Variable<int>(messageReminders),
        Variable<int>(birthdayReminders),
        Variable<int>(achievementNotifications),
        Variable<int>(dailyQuests),
        Variable<int>(dataEncryption),
        Variable<int>(analytics),
        Variable<int>(autoLock),
        Variable<int>(id)
      ],
      updates: {userSettings},
      updateKind: UpdateKind.update,
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        mementos,
        mementoEntries,
        mementosInsert,
        mementosDelete,
        mementosUpdate,
        labels,
        mementoLabels,
        notes,
        scheduledMessages,
        achievements,
        quests,
        leaderboard,
        messageTemplates,
        userSettings
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('mementos',
                limitUpdateKind: UpdateKind.insert),
            result: [
              TableUpdate('memento_entries', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('mementos',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('memento_entries', kind: UpdateKind.insert),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('mementos',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('memento_entries', kind: UpdateKind.insert),
            ],
          ),
        ],
      );
}

class SearchMementosResult {
  final Memento result;
  SearchMementosResult({
    required this.result,
  });
}
