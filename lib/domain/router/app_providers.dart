import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:etapa1/ui/provider/products_provider.dart';

/// * [appProviders] is a list of providers that will be used in the app.
List<SingleChildWidget> get appProviders => [
  ChangeNotifierProvider(create: (_) => ProductsProvider()),
];