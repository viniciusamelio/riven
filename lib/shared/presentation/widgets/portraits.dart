import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Portrait extends StatelessWidget {
  final Function onTap;
  final String imageUrl;
  final String name;
  final String lane;
  final Color accentColor;

  const Portrait({
    Key? key,
    required this.onTap,
    required this.imageUrl,
    required this.name,
    required this.lane,
    required this.accentColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  )),
            ),
            Text(
              name,
              style: GoogleFonts.inter(color: accentColor, fontSize: 12),
            ),
            Text(
              lane,
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
