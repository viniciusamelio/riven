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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.data.onTap();
      },
      child: Container(
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
              ),
            ),
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
