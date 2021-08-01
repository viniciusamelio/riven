// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoadingStore on _LoadingStoreBase, Store {
  Computed<FutureStatus?>? _$listRequestStatusComputed;

  @override
  FutureStatus? get listRequestStatus => (_$listRequestStatusComputed ??=
          Computed<FutureStatus?>(() => super.listRequestStatus,
              name: '_LoadingStoreBase.listRequestStatus'))
      .value;

  final _$listBuildObservableAtom =
      Atom(name: '_LoadingStoreBase.listBuildObservable');

  @override
  ObservableFuture<Either<DomainException, List<Build>>>?
      get listBuildObservable {
    _$listBuildObservableAtom.reportRead();
    return super.listBuildObservable;
  }

  @override
  set listBuildObservable(
      ObservableFuture<Either<DomainException, List<Build>>>? value) {
    _$listBuildObservableAtom.reportWrite(value, super.listBuildObservable, () {
      super.listBuildObservable = value;
    });
  }

  final _$_LoadingStoreBaseActionController =
      ActionController(name: '_LoadingStoreBase');

  @override
  dynamic listBuilds() {
    final _$actionInfo = _$_LoadingStoreBaseActionController.startAction(
        name: '_LoadingStoreBase.listBuilds');
    try {
      return super.listBuilds();
    } finally {
      _$_LoadingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listBuildObservable: ${listBuildObservable},
listRequestStatus: ${listRequestStatus}
    ''';
  }
}
