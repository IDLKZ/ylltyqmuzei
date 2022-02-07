import 'package:flutter/material.dart';
import 'package:ylltyqmuzei/models/models.dart';
import 'package:ylltyqmuzei/services/api.dart';
import 'package:ylltyqmuzei/widgets/thirdmodels_widget.dart';

class ShowcaseModels extends StatefulWidget {
  const ShowcaseModels({Key? key}) : super(key: key);

  @override
  _ShowcaseModelsState createState() => _ShowcaseModelsState();
}

class _ShowcaseModelsState extends State<ShowcaseModels> {
  late RouteSettings args;
  late Future<ModelList> models;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings;
    String id = args.arguments as String;
    models = ThirdModelsProvider().getModelByShowcase(id);
    return ThirdModelWidget(models: models,);
  }
}
