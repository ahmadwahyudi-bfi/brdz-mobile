// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeUiState {
  List<TransactionHistoryModel> get items => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  DateTime? get lastRefreshed => throw _privateConstructorUsedError;

  /// Create a copy of HomeUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeUiStateCopyWith<HomeUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeUiStateCopyWith<$Res> {
  factory $HomeUiStateCopyWith(
    HomeUiState value,
    $Res Function(HomeUiState) then,
  ) = _$HomeUiStateCopyWithImpl<$Res, HomeUiState>;
  @useResult
  $Res call({
    List<TransactionHistoryModel> items,
    bool loading,
    String? error,
    DateTime? lastRefreshed,
  });
}

/// @nodoc
class _$HomeUiStateCopyWithImpl<$Res, $Val extends HomeUiState>
    implements $HomeUiStateCopyWith<$Res> {
  _$HomeUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? loading = null,
    Object? error = freezed,
    Object? lastRefreshed = freezed,
  }) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<TransactionHistoryModel>,
            loading: null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastRefreshed: freezed == lastRefreshed
                ? _value.lastRefreshed
                : lastRefreshed // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeUiStateImplCopyWith<$Res>
    implements $HomeUiStateCopyWith<$Res> {
  factory _$$HomeUiStateImplCopyWith(
    _$HomeUiStateImpl value,
    $Res Function(_$HomeUiStateImpl) then,
  ) = __$$HomeUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<TransactionHistoryModel> items,
    bool loading,
    String? error,
    DateTime? lastRefreshed,
  });
}

/// @nodoc
class __$$HomeUiStateImplCopyWithImpl<$Res>
    extends _$HomeUiStateCopyWithImpl<$Res, _$HomeUiStateImpl>
    implements _$$HomeUiStateImplCopyWith<$Res> {
  __$$HomeUiStateImplCopyWithImpl(
    _$HomeUiStateImpl _value,
    $Res Function(_$HomeUiStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? loading = null,
    Object? error = freezed,
    Object? lastRefreshed = freezed,
  }) {
    return _then(
      _$HomeUiStateImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<TransactionHistoryModel>,
        loading: null == loading
            ? _value.loading
            : loading // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastRefreshed: freezed == lastRefreshed
            ? _value.lastRefreshed
            : lastRefreshed // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$HomeUiStateImpl implements _HomeUiState {
  const _$HomeUiStateImpl({
    final List<TransactionHistoryModel> items = const [],
    this.loading = false,
    this.error,
    this.lastRefreshed,
  }) : _items = items;

  final List<TransactionHistoryModel> _items;
  @override
  @JsonKey()
  List<TransactionHistoryModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  final String? error;
  @override
  final DateTime? lastRefreshed;

  @override
  String toString() {
    return 'HomeUiState(items: $items, loading: $loading, error: $error, lastRefreshed: $lastRefreshed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeUiStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.lastRefreshed, lastRefreshed) ||
                other.lastRefreshed == lastRefreshed));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    loading,
    error,
    lastRefreshed,
  );

  /// Create a copy of HomeUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeUiStateImplCopyWith<_$HomeUiStateImpl> get copyWith =>
      __$$HomeUiStateImplCopyWithImpl<_$HomeUiStateImpl>(this, _$identity);
}

abstract class _HomeUiState implements HomeUiState {
  const factory _HomeUiState({
    final List<TransactionHistoryModel> items,
    final bool loading,
    final String? error,
    final DateTime? lastRefreshed,
  }) = _$HomeUiStateImpl;

  @override
  List<TransactionHistoryModel> get items;
  @override
  bool get loading;
  @override
  String? get error;
  @override
  DateTime? get lastRefreshed;

  /// Create a copy of HomeUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeUiStateImplCopyWith<_$HomeUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
