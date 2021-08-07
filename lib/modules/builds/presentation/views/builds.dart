import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:riven/modules/builds/presentation/presenters/builds_store.dart';
import 'package:riven/shared/domain/entities/build_set.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:riven/shared/presentation/styles/padding.dart';
import 'package:riven/shared/presentation/widgets/organisms/portrait_grid.dart';
import 'package:riven/shared/presentation/widgets/params/portrait_grid.dart';

class BuildsScreen extends StatefulWidget {
  const BuildsScreen({Key? key}) : super(key: key);

  @override
  _BuildsState createState() => _BuildsState();
}

class _BuildsState extends State<BuildsScreen> {
  late BuildsStore _buildsStore;

  @override
  void initState() {
    _buildsStore = BuildsStore();
    _buildsStore.buildSet = Provider.of<BuildSet>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: screenPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              "Builds",
              style: GoogleFonts.inter(
                color: primaryGreen,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(
              bottom: 50,
            ),
            width: MediaQuery.of(context).size.width,
            child: PortraitsGrid(
              data: PortraitGridParams(
                _buildsStore.buildSet!.builds,
              ),
            ),
          )
        ],
      ),
    );
  }
}
