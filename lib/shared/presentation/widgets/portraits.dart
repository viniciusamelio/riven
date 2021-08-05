import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riven/shared/presentation/widgets/params/portraits.dart';

class Portrait extends StatefulWidget {
  final PortraitParams data;

  Portrait({Key? key, required this.data}) : super(key: key);

  @override
  _PortraitState createState() => _PortraitState();
}

class _PortraitState extends State<Portrait> {
  double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.data.onTap,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                height:
                    widget.data.size ?? MediaQuery.of(context).size.width / 8,
                width:
                    widget.data.size ?? MediaQuery.of(context).size.width / 8,
                child: CachedNetworkImage(
                  imageUrl: widget.data.imageUrl,

                  fit: BoxFit.cover,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  //diskCacheExpire: Duration(days: 30),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                )),
            Text(
              widget.data.name,
              style: GoogleFonts.inter(
                  color: widget.data.accentColor, fontSize: 12),
            ),
            Text(
              widget.data.lane,
              style: GoogleFonts.inter(
                fontSize: 10,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
