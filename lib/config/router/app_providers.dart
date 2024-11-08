import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:etapa1/core/exports.dart';

List<SingleChildWidget> get appProviders => [
  ChangeNotifierProvider(create: (_) => ProductsProvider()),
];