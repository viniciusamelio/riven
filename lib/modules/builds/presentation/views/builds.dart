import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:riven/modules/builds/presentation/presenters/builds_store.dart';
import 'package:riven/shared/domain/entities/build_set.dart';
import 'package:riven/shared/presentation/styles/color.dart';
import 'package:riven/shared/presentation/widgets/params/portraits.dart';
import 'package:riven/shared/presentation/widgets/portraits.dart';

class Builds extends StatefulWidget {
  const Builds({Key? key}) : super(key: key);

  @override
  _BuildsState createState() => _BuildsState();
}

class _BuildsState extends State<Builds> {
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
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 20,
      ),
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
            child: GridView.builder(
                itemCount: _buildsStore.buildSet?.builds.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  final champion =
                      _buildsStore.buildSet?.builds[index].champion;
                  return Portrait(
                    data: PortraitParams(
                      accentColor: primaryGreen,
                      imageUrl: champion!.portraitUrl,
                      name: champion.name,
                      size: 10,
                      lane: champion.role,
                      onTap: () => print('clicked'),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
