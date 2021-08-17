import 'package:fpdart/fpdart.dart';
import 'package:mobx/mobx.dart';
import 'package:riven/shared/domain/entities/build.dart';
import 'package:riven/shared/domain/errors/domain_exception.dart';
import 'package:riven/shared/domain/use_cases/builds/iget_builds_use_case.dart';
part 'loading_store.g.dart';

class LoadingStore = _LoadingStoreBase with _$LoadingStore;

abstract class _LoadingStoreBase with Store {
  final IGetBuildsUseCase _getBuildUseCase;

  _LoadingStoreBase(this._getBuildUseCase) {
    listBuilds();
  }

  @observable
  ObservableFuture<Either<DomainException, List<Build>>>? listBuildObservable;

  @computed
  FutureStatus? get listRequestStatus => listBuildObservable?.status;

  @action
  listBuilds() {
    listBuildObservable = _getBuildUseCase().asObservable();
  }
}
