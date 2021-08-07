import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:riven/shared/presentation/styles/text.dart';
import 'package:riven/shared/presentation/widgets/params/portraits.dart';

class Portrait extends StatefulWidget {
  final PortraitParams data;

  Portrait({Key? key, required this.data}) : super(key: key);

  @override
  _PortraitState createState() => _PortraitState();
}

class _PortraitState extends State<Portrait> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.data.onTap!(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: widget.data.size ?? MediaQuery.of(context).size.width / 8,
            width: widget.data.size ?? MediaQuery.of(context).size.width / 8,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: CachedNetworkImageProvider(widget.data.imageUrl),
                ),
                border: Border.all(
                  color: widget.data.accentColor ?? Colors.transparent,
                  width: widget.data.borderWidth ?? 1,
                )),
          ),
          if (widget.data.name != null)
            Text(
              widget.data.name!,
              style: assetLabelTextStyle(
                size: 12,
                color: widget.data.textColor,
              ),
              textAlign: TextAlign.center,
            )
          else
            Container(),
          if (widget.data.lane != null)
            Text(
              widget.data.lane!,
              style: assetLabelTextStyle(
                size: 10,
                color: Colors.white,
                weight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            )
          else
            Container(),
        ],
      ),
    );
  }
}
