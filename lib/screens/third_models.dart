import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:ylltyqmuzei/mixins/mixins.dart';
import 'package:ylltyqmuzei/models/models.dart';
import 'package:ylltyqmuzei/services/api.dart';
import 'package:ylltyqmuzei/widgets/my_appbar.dart';
import 'package:ylltyqmuzei/widgets/nav_bar.dart';
import 'package:ylltyqmuzei/widgets/thirdmodels_widget.dart';

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
