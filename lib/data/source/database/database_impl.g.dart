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
  late final GeneratedColumn<String> birthday = GeneratedColumn<String>(
      'birthday', aliasedName, true,
      type: DriftSqlType.string,
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
          .read(DriftSqlType.string, data['${effectivePrefix}birthday']),
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
  final String? birthday;
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
      map['birthday'] = Variable<String>(birthday);
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
      birthday: serializer.fromJson<String?>(json['birthday']),
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
      'birthday': serializer.toJson<String?>(birthday),
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
          Value<String?> birthday = const Value.absent()}) =>
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
  final Value<String?> birthday;
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
    Expression<String>? birthday,
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
      Value<String?>? birthday}) {
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
      map['birthday'] = Variable<String>(birthday.value);
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
      String? birthday) {
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
        Variable<String>(birthday)
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
      String? birthday,
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
        Variable<String>(birthday),
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
        notes
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
