import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:riven/modules/home/presentation/presenters/loading_store.dart';
import 'package:riven/shared/domain/di/builds/containers.dart';
import 'package:riven/shared/domain/entities/build_set.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late LoadingStore _loadingStore;
  late ReactionDisposer _loadingBuildsReaction;

  @override
  void initState() {
    _loadingStore = LoadingStore(
      getBuildsDIContainer(),
    );

    //TODO: Separar a reaction num arquivo separado
    _loadingBuildsReaction = reaction(
      (_) =>
          _loadingStore.listBuildObservable?.status == FutureStatus.fulfilled,
      (_) {
        BuildSet _buildSet = Provider.of<BuildSet>(context, listen: false);
        final value = _loadingStore.listBuildObservable?.value;
        if (value != null) {
          value.fold(
            (exception) {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.WARNING,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Opa!',
                desc: exception.message,
                btnOkText: 'Tentar novamente',
                btnOkOnPress: () => _loadingStore.listBuilds(),
              )..show();
            },
            (buildList) {
              //TODO: Adicionar o push para a tela de listagem
              _buildSet.builds.addAll(buildList);
            },
          );
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _loadingBuildsReaction();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/logo.png',
                scale: .95,
              ),
              SizedBox(
                height: 135,
                child: LottieBuilder.asset('assets/animations/loading.json'),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Carregando...",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
