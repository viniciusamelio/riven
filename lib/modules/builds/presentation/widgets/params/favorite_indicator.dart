class FavoriteIndicatorParams {
  bool isFavorite;
  Function setFavoriteFunction;
  Function unsetFavoriteFunction;

  FavoriteIndicatorParams({
    required this.isFavorite,
    required this.setFavoriteFunction,
    required this.unsetFavoriteFunction,
  });
}
