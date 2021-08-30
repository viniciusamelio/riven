// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_champions_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteChampionsStore on _FavoriteChampionsStoreBase, Store {
  Computed<FutureStatus?>? _$listFavoriteChampionsStatusComputed;

  @override
  FutureStatus? get listFavoriteChampionsStatus =>
      (_$listFavoriteChampionsStatusComputed ??= Computed<FutureStatus?>(
              () => super.listFavoriteChampionsStatus,
              name: '_FavoriteChampionsStoreBase.listFavoriteChampionsStatus'))
          .value;

  final _$listFavoriteChampionsStoreObservableAtom = Atom(
      name: '_FavoriteChampionsStoreBase.listFavoriteChampionsStoreObservable');

  @override
  ObservableFuture<List<Build>>? get listFavoriteChampionsStoreObservable {
    _$listFavoriteChampionsStoreObservableAtom.reportRead();
    return super.listFavoriteChampionsStoreObservable;
  }

  @override
  set listFavoriteChampionsStoreObservable(
      ObservableFuture<List<Build>>? value) {
    _$listFavoriteChampionsStoreObservableAtom
        .reportWrite(value, super.listFavoriteChampionsStoreObservable, () {
      super.listFavoriteChampionsStoreObservable = value;
    });
  }

  final _$_FavoriteChampionsStoreBaseActionController =
      ActionController(name: '_FavoriteChampionsStoreBase');

  @override
  dynamic getFavoriteChampionsStore() {
    final _$actionInfo =
        _$_FavoriteChampionsStoreBaseActionController.startAction(
            name: '_FavoriteChampionsStoreBase.getFavoriteChampionsStore');
    try {
      return super.getFavoriteChampionsStore();
    } finally {
      _$_FavoriteChampionsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listFavoriteChampionsStoreObservable: ${listFavoriteChampionsStoreObservable},
listFavoriteChampionsStatus: ${listFavoriteChampionsStatus}
    ''';
  }
}
