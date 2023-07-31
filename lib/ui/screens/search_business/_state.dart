part of 'search_business.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();
  String? query;
  bool loading = false;
  bool noResultsFound = false;

  void setResults(bool value) {
    noResultsFound = value;
    loading = false;
    notifyListeners();
  }

  void onChange(String? query) {
    this.query = query;
    notifyListeners();
  }

  void setLoading(bool value) {
    loading = value;
    noResultsFound = false;
    notifyListeners();
  }

  //
  String? cityQuery;
  bool cityLoading = false;
  bool noCityFound = false;

  void setCities(bool value) {
    noCityFound = value;
    cityLoading = false;
    notifyListeners();
  }

  void onCityChange(String? query) {
    cityQuery = query;
    notifyListeners();
  }

  void setCityLoading(bool value) {
    cityLoading = value;
    noCityFound = false;
    notifyListeners();
  }
}
