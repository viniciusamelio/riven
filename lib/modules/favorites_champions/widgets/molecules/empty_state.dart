import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:riven/shared/presentation/styles/padding.dart';

class FavoriteChampionsEmptyStateScreen extends StatelessWidget {
  const FavoriteChampionsEmptyStateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: screenPadding,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 135,
                child: LottieBuilder.asset('assets/animations/empty.json'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Parece que você ainda não possui favoritos...",
                style: GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
