import 'package:flutter/material.dart';
import 'package:riven/modules/builds/presentation/widgets/params/favorite_indicator.dart';
import 'package:riven/shared/presentation/styles/color.dart';

class FavoriteIndicator extends StatefulWidget {
  final FavoriteIndicatorParams data;
  const FavoriteIndicator({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _FavoriteIndicatorState createState() => _FavoriteIndicatorState();
}

class _FavoriteIndicatorState extends State<FavoriteIndicator> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.data.isFavorite) {
          widget.data.setFavoriteFunction();
        } else {
          widget.data.unsetFavoriteFunction();
        }
        setState(() {
          widget.data.isFavorite = !widget.data.isFavorite;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: widget.data.isFavorite ? 40 : 35,
        child: Icon(
          Icons.favorite,
          color: !widget.data.isFavorite ? greyTextColor.withAlpha(220) : red,
          size: 35,
        ),
      ),
    );
  }
}
