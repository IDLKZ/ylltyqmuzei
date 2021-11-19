import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:welcome/mixins/mixins.dart';
import 'package:welcome/models/models.dart';
import 'package:welcome/services/api.dart';
import 'package:welcome/widgets/my_appbar.dart';
import 'package:welcome/widgets/nav_bar.dart';
import 'package:welcome/widgets/thirdmodels_widget.dart';

class ThirdModels extends StatefulWidget {
  const ThirdModels({Key? key}) : super(key: key);

  @override
  _ThirdModelsState createState() => _ThirdModelsState();
}

class _ThirdModelsState extends State<ThirdModels> {
  late RouteSettings args;
  late Future<ModelList> models;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings;
    String id = args.arguments as String;
    models = ThirdModelsProvider().getModelsByHallId(id);
    return ThirdModelWidget(models: models,);
  }
}
