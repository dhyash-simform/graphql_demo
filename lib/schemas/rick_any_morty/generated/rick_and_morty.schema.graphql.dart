class InputFilterCharacter {
  factory InputFilterCharacter({
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  }) =>
      InputFilterCharacter._({
        if (name != null) r'name': name,
        if (status != null) r'status': status,
        if (species != null) r'species': species,
        if (type != null) r'type': type,
        if (gender != null) r'gender': gender,
      });

  InputFilterCharacter._(this._$data);

  factory InputFilterCharacter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('status')) {
      final l$status = data['status'];
      result$data['status'] = (l$status as String?);
    }
    if (data.containsKey('species')) {
      final l$species = data['species'];
      result$data['species'] = (l$species as String?);
    }
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = (l$type as String?);
    }
    if (data.containsKey('gender')) {
      final l$gender = data['gender'];
      result$data['gender'] = (l$gender as String?);
    }
    return InputFilterCharacter._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get status => (_$data['status'] as String?);

  String? get species => (_$data['species'] as String?);

  String? get type => (_$data['type'] as String?);

  String? get gender => (_$data['gender'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('status')) {
      final l$status = status;
      result$data['status'] = l$status;
    }
    if (_$data.containsKey('species')) {
      final l$species = species;
      result$data['species'] = l$species;
    }
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] = l$type;
    }
    if (_$data.containsKey('gender')) {
      final l$gender = gender;
      result$data['gender'] = l$gender;
    }
    return result$data;
  }

  CopyWithInputFilterCharacter<InputFilterCharacter> get copyWith =>
      CopyWithInputFilterCharacter(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is InputFilterCharacter) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (_$data.containsKey('status') != other._$data.containsKey('status')) {
      return false;
    }
    if (l$status != lOther$status) {
      return false;
    }
    final l$species = species;
    final lOther$species = other.species;
    if (_$data.containsKey('species') != other._$data.containsKey('species')) {
      return false;
    }
    if (l$species != lOther$species) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != lOther$type) {
      return false;
    }
    final l$gender = gender;
    final lOther$gender = other.gender;
    if (_$data.containsKey('gender') != other._$data.containsKey('gender')) {
      return false;
    }
    if (l$gender != lOther$gender) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$status = status;
    final l$species = species;
    final l$type = type;
    final l$gender = gender;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('status') ? l$status : const {},
      _$data.containsKey('species') ? l$species : const {},
      _$data.containsKey('type') ? l$type : const {},
      _$data.containsKey('gender') ? l$gender : const {},
    ]);
  }
}

abstract class CopyWithInputFilterCharacter<TRes> {
  factory CopyWithInputFilterCharacter(
    InputFilterCharacter instance,
    TRes Function(InputFilterCharacter) then,
  ) = _CopyWithImplInputFilterCharacter;

  factory CopyWithInputFilterCharacter.stub(TRes res) =
      _CopyWithStubImplInputFilterCharacter;

  TRes call({
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  });
}

class _CopyWithImplInputFilterCharacter<TRes>
    implements CopyWithInputFilterCharacter<TRes> {
  _CopyWithImplInputFilterCharacter(
    this._instance,
    this._then,
  );

  final InputFilterCharacter _instance;

  final TRes Function(InputFilterCharacter) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? status = _undefined,
    Object? species = _undefined,
    Object? type = _undefined,
    Object? gender = _undefined,
  }) =>
      _then(InputFilterCharacter._({
        ..._instance._$data,
        if (name != _undefined) 'name': (name as String?),
        if (status != _undefined) 'status': (status as String?),
        if (species != _undefined) 'species': (species as String?),
        if (type != _undefined) 'type': (type as String?),
        if (gender != _undefined) 'gender': (gender as String?),
      }));
}

class _CopyWithStubImplInputFilterCharacter<TRes>
    implements CopyWithInputFilterCharacter<TRes> {
  _CopyWithStubImplInputFilterCharacter(this._res);

  TRes _res;

  call({
    String? name,
    String? status,
    String? species,
    String? type,
    String? gender,
  }) =>
      _res;
}

class InputFilterEpisode {
  factory InputFilterEpisode({
    String? name,
    String? episode,
  }) =>
      InputFilterEpisode._({
        if (name != null) r'name': name,
        if (episode != null) r'episode': episode,
      });

  InputFilterEpisode._(this._$data);

  factory InputFilterEpisode.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('episode')) {
      final l$episode = data['episode'];
      result$data['episode'] = (l$episode as String?);
    }
    return InputFilterEpisode._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get episode => (_$data['episode'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('episode')) {
      final l$episode = episode;
      result$data['episode'] = l$episode;
    }
    return result$data;
  }

  CopyWithInputFilterEpisode<InputFilterEpisode> get copyWith =>
      CopyWithInputFilterEpisode(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is InputFilterEpisode) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$episode = episode;
    final lOther$episode = other.episode;
    if (_$data.containsKey('episode') != other._$data.containsKey('episode')) {
      return false;
    }
    if (l$episode != lOther$episode) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$episode = episode;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('episode') ? l$episode : const {},
    ]);
  }
}

abstract class CopyWithInputFilterEpisode<TRes> {
  factory CopyWithInputFilterEpisode(
    InputFilterEpisode instance,
    TRes Function(InputFilterEpisode) then,
  ) = _CopyWithImplInputFilterEpisode;

  factory CopyWithInputFilterEpisode.stub(TRes res) =
      _CopyWithStubImplInputFilterEpisode;

  TRes call({
    String? name,
    String? episode,
  });
}

class _CopyWithImplInputFilterEpisode<TRes>
    implements CopyWithInputFilterEpisode<TRes> {
  _CopyWithImplInputFilterEpisode(
    this._instance,
    this._then,
  );

  final InputFilterEpisode _instance;

  final TRes Function(InputFilterEpisode) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? episode = _undefined,
  }) =>
      _then(InputFilterEpisode._({
        ..._instance._$data,
        if (name != _undefined) 'name': (name as String?),
        if (episode != _undefined) 'episode': (episode as String?),
      }));
}

class _CopyWithStubImplInputFilterEpisode<TRes>
    implements CopyWithInputFilterEpisode<TRes> {
  _CopyWithStubImplInputFilterEpisode(this._res);

  TRes _res;

  call({
    String? name,
    String? episode,
  }) =>
      _res;
}

class InputFilterLocation {
  factory InputFilterLocation({
    String? name,
    String? type,
    String? dimension,
  }) =>
      InputFilterLocation._({
        if (name != null) r'name': name,
        if (type != null) r'type': type,
        if (dimension != null) r'dimension': dimension,
      });

  InputFilterLocation._(this._$data);

  factory InputFilterLocation.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = (l$type as String?);
    }
    if (data.containsKey('dimension')) {
      final l$dimension = data['dimension'];
      result$data['dimension'] = (l$dimension as String?);
    }
    return InputFilterLocation._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);

  String? get type => (_$data['type'] as String?);

  String? get dimension => (_$data['dimension'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] = l$type;
    }
    if (_$data.containsKey('dimension')) {
      final l$dimension = dimension;
      result$data['dimension'] = l$dimension;
    }
    return result$data;
  }

  CopyWithInputFilterLocation<InputFilterLocation> get copyWith =>
      CopyWithInputFilterLocation(
        this,
        (i) => i,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is InputFilterLocation) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != lOther$type) {
      return false;
    }
    final l$dimension = dimension;
    final lOther$dimension = other.dimension;
    if (_$data.containsKey('dimension') !=
        other._$data.containsKey('dimension')) {
      return false;
    }
    if (l$dimension != lOther$dimension) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$type = type;
    final l$dimension = dimension;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('type') ? l$type : const {},
      _$data.containsKey('dimension') ? l$dimension : const {},
    ]);
  }
}

abstract class CopyWithInputFilterLocation<TRes> {
  factory CopyWithInputFilterLocation(
    InputFilterLocation instance,
    TRes Function(InputFilterLocation) then,
  ) = _CopyWithImplInputFilterLocation;

  factory CopyWithInputFilterLocation.stub(TRes res) =
      _CopyWithStubImplInputFilterLocation;

  TRes call({
    String? name,
    String? type,
    String? dimension,
  });
}

class _CopyWithImplInputFilterLocation<TRes>
    implements CopyWithInputFilterLocation<TRes> {
  _CopyWithImplInputFilterLocation(
    this._instance,
    this._then,
  );

  final InputFilterLocation _instance;

  final TRes Function(InputFilterLocation) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? type = _undefined,
    Object? dimension = _undefined,
  }) =>
      _then(InputFilterLocation._({
        ..._instance._$data,
        if (name != _undefined) 'name': (name as String?),
        if (type != _undefined) 'type': (type as String?),
        if (dimension != _undefined) 'dimension': (dimension as String?),
      }));
}

class _CopyWithStubImplInputFilterLocation<TRes>
    implements CopyWithInputFilterLocation<TRes> {
  _CopyWithStubImplInputFilterLocation(this._res);

  TRes _res;

  call({
    String? name,
    String? type,
    String? dimension,
  }) =>
      _res;
}

enum Enum__TypeKind {
  SCALAR,
  OBJECT,
  INTERFACE,
  UNION,
  ENUM,
  INPUT_OBJECT,
  LIST,
  NON_NULL,
  $unknown
}

String toJsonEnum__TypeKind(Enum__TypeKind e) {
  switch (e) {
    case Enum__TypeKind.SCALAR:
      return r'SCALAR';
    case Enum__TypeKind.OBJECT:
      return r'OBJECT';
    case Enum__TypeKind.INTERFACE:
      return r'INTERFACE';
    case Enum__TypeKind.UNION:
      return r'UNION';
    case Enum__TypeKind.ENUM:
      return r'ENUM';
    case Enum__TypeKind.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum__TypeKind.LIST:
      return r'LIST';
    case Enum__TypeKind.NON_NULL:
      return r'NON_NULL';
    case Enum__TypeKind.$unknown:
      return r'$unknown';
  }
}

Enum__TypeKind fromJsonEnum__TypeKind(String value) {
  switch (value) {
    case r'SCALAR':
      return Enum__TypeKind.SCALAR;
    case r'OBJECT':
      return Enum__TypeKind.OBJECT;
    case r'INTERFACE':
      return Enum__TypeKind.INTERFACE;
    case r'UNION':
      return Enum__TypeKind.UNION;
    case r'ENUM':
      return Enum__TypeKind.ENUM;
    case r'INPUT_OBJECT':
      return Enum__TypeKind.INPUT_OBJECT;
    case r'LIST':
      return Enum__TypeKind.LIST;
    case r'NON_NULL':
      return Enum__TypeKind.NON_NULL;
    default:
      return Enum__TypeKind.$unknown;
  }
}

enum Enum__DirectiveLocation {
  QUERY,
  MUTATION,
  SUBSCRIPTION,
  FIELD,
  FRAGMENT_DEFINITION,
  FRAGMENT_SPREAD,
  INLINE_FRAGMENT,
  VARIABLE_DEFINITION,
  SCHEMA,
  SCALAR,
  OBJECT,
  FIELD_DEFINITION,
  ARGUMENT_DEFINITION,
  INTERFACE,
  UNION,
  ENUM,
  ENUM_VALUE,
  INPUT_OBJECT,
  INPUT_FIELD_DEFINITION,
  $unknown
}

String toJsonEnum__DirectiveLocation(Enum__DirectiveLocation e) {
  switch (e) {
    case Enum__DirectiveLocation.QUERY:
      return r'QUERY';
    case Enum__DirectiveLocation.MUTATION:
      return r'MUTATION';
    case Enum__DirectiveLocation.SUBSCRIPTION:
      return r'SUBSCRIPTION';
    case Enum__DirectiveLocation.FIELD:
      return r'FIELD';
    case Enum__DirectiveLocation.FRAGMENT_DEFINITION:
      return r'FRAGMENT_DEFINITION';
    case Enum__DirectiveLocation.FRAGMENT_SPREAD:
      return r'FRAGMENT_SPREAD';
    case Enum__DirectiveLocation.INLINE_FRAGMENT:
      return r'INLINE_FRAGMENT';
    case Enum__DirectiveLocation.VARIABLE_DEFINITION:
      return r'VARIABLE_DEFINITION';
    case Enum__DirectiveLocation.SCHEMA:
      return r'SCHEMA';
    case Enum__DirectiveLocation.SCALAR:
      return r'SCALAR';
    case Enum__DirectiveLocation.OBJECT:
      return r'OBJECT';
    case Enum__DirectiveLocation.FIELD_DEFINITION:
      return r'FIELD_DEFINITION';
    case Enum__DirectiveLocation.ARGUMENT_DEFINITION:
      return r'ARGUMENT_DEFINITION';
    case Enum__DirectiveLocation.INTERFACE:
      return r'INTERFACE';
    case Enum__DirectiveLocation.UNION:
      return r'UNION';
    case Enum__DirectiveLocation.ENUM:
      return r'ENUM';
    case Enum__DirectiveLocation.ENUM_VALUE:
      return r'ENUM_VALUE';
    case Enum__DirectiveLocation.INPUT_OBJECT:
      return r'INPUT_OBJECT';
    case Enum__DirectiveLocation.INPUT_FIELD_DEFINITION:
      return r'INPUT_FIELD_DEFINITION';
    case Enum__DirectiveLocation.$unknown:
      return r'$unknown';
  }
}

Enum__DirectiveLocation fromJsonEnum__DirectiveLocation(String value) {
  switch (value) {
    case r'QUERY':
      return Enum__DirectiveLocation.QUERY;
    case r'MUTATION':
      return Enum__DirectiveLocation.MUTATION;
    case r'SUBSCRIPTION':
      return Enum__DirectiveLocation.SUBSCRIPTION;
    case r'FIELD':
      return Enum__DirectiveLocation.FIELD;
    case r'FRAGMENT_DEFINITION':
      return Enum__DirectiveLocation.FRAGMENT_DEFINITION;
    case r'FRAGMENT_SPREAD':
      return Enum__DirectiveLocation.FRAGMENT_SPREAD;
    case r'INLINE_FRAGMENT':
      return Enum__DirectiveLocation.INLINE_FRAGMENT;
    case r'VARIABLE_DEFINITION':
      return Enum__DirectiveLocation.VARIABLE_DEFINITION;
    case r'SCHEMA':
      return Enum__DirectiveLocation.SCHEMA;
    case r'SCALAR':
      return Enum__DirectiveLocation.SCALAR;
    case r'OBJECT':
      return Enum__DirectiveLocation.OBJECT;
    case r'FIELD_DEFINITION':
      return Enum__DirectiveLocation.FIELD_DEFINITION;
    case r'ARGUMENT_DEFINITION':
      return Enum__DirectiveLocation.ARGUMENT_DEFINITION;
    case r'INTERFACE':
      return Enum__DirectiveLocation.INTERFACE;
    case r'UNION':
      return Enum__DirectiveLocation.UNION;
    case r'ENUM':
      return Enum__DirectiveLocation.ENUM;
    case r'ENUM_VALUE':
      return Enum__DirectiveLocation.ENUM_VALUE;
    case r'INPUT_OBJECT':
      return Enum__DirectiveLocation.INPUT_OBJECT;
    case r'INPUT_FIELD_DEFINITION':
      return Enum__DirectiveLocation.INPUT_FIELD_DEFINITION;
    default:
      return Enum__DirectiveLocation.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
