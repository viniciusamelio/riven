import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Portrait extends StatefulWidget {
  final Function onTap;
  final String imageUrl;
  final String name;
  final String lane;
  final Color accentColor;

  Portrait({
    Key? key,
    required this.onTap,
    required this.imageUrl,
    required this.name,
    required this.lane,
    required this.accentColor,
    size,
  }) : super(key: key);

  @override
  _PortraitState createState() => _PortraitState();
}

class _PortraitState extends State<Portrait> {
  double? size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: size ?? 65,
              width: size ?? 65,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  )),
            ),
            Text(
              widget.name,
              style: GoogleFonts.inter(color: widget.accentColor, fontSize: 12),
            ),
            Text(
              widget.lane,
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
