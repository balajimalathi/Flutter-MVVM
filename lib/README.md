# Architecture Guide

Flutter MVVM is splited into 3 folders

[core] 

This folder consists of all the core functionalities of the application
- base
- constants
- extensions
- init
- navigation

## base

base folder have two sub-folders and locator (get_it) file for dependency injection

### base_model
This class is responsible for state management and internet connectivity checking.
View models extends this base_model for accessing states and internet connectivity.

Abstract class of base model will be implemented in view model

```dart
abstract class BaseViewModel {
  //Since we are reusing this same abstract class we are setting context in every invocations
  late BuildContext context;

  //Locale manager is singleton, handles the Sharedpreferences
  LocaleManager localeManager = LocaleManager.instance;

  //Navigation service is a common class, handles all the navigation with data inside the application
  //Note: You can use traditional methods like Navigator.push
  NavigationService navigation = NavigationService.instance;

  //Setting context
  void setContext(BuildContext context);

  //Variable Initialization
  //Eg. TextEditingControllers and Controllers
  void init() {}
}
```

### base_view
I have used ChangeNotifierProvider for the whole application.
Though the Provider are scoped we can nest the Baseview with a new viewmodel,
which give us more control over the State management

```dart
class BaseView<T extends BaseModel> extends StatefulWidget {

  // Model ready will be executed first
  // Note: This is not tested with Postcallback functions
  final Function(T)? onModelReady;

  // Builder will be our scaffold
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  BaseView({required this.builder, required this.onModelReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {

  //Every Viewmodel and other Services should be added inside the Locator file
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: model, //Viewmodel object
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
```

### locator.dart
This is where the dependency injection happens

```dart
GetIt locator = GetIt.instance;

//Setuplocator should be called in the main() for injecting.
void setupLocator() {
  // API - Services
  locator.registerLazySingleton(() => Service());

  // Viewmodels
  locator.registerFactory(() => ViewModel());

  // Dio
  locator.registerFactory(() => NetworkManager());
}

```

[product]

Product folder consists of all the core functionalities of the application
- components
- provider
- utils

[view]

[main.dart]


[core]: <https://github.com/RabbitRk/Flutter-MVVM/tree/master/lib/core>
[product]: <https://github.com/RabbitRk/Flutter-MVVM/tree/master/lib/product>
[view]: <https://github.com/RabbitRk/Flutter-MVVM/tree/master/lib/view>
[main.dart]: <https://github.com/RabbitRk/Flutter-MVVM/tree/master/lib/main.dart>
