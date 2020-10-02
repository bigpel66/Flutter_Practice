import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider_practice/models/models.dart';

import 'package:provider_practice/services/services.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders,
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: Api()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<Api, AuthenticationService>(
    update: (context, api, authenticationService) {
      return AuthenticationService(api: api);
    },
  ),
];

List<SingleChildWidget> uiConsumableProviders = [
  StreamProvider<User>(
    create: (context) =>
        Provider.of<AuthenticationService>(context, listen: false).user,
    initialData: User.initial(),
  ),
];
