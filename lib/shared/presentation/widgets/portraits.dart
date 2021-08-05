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
              height: size ?? 65,
              width: size ?? 65,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(widget.data.imageUrl),
                    fit: BoxFit.cover,
                  )),
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
