part of 'cubit.dart';

class _CitiesProvider {
  static Future<List<City>> get() async {
    try {
      final resp = await rootBundle.loadString('assets/us-cities.json');
      final raw = await json.decode(resp) as List;
      final cities =
          List.generate(raw.length, (index) => City.fromMap(raw[index]));

      return cities;
    } catch (e) {
      debugPrint('---- Exception Fetch Cities ----');
      debugPrint(e.toString());
      throw Exception("Internal Server Error");
    }
  }
}
