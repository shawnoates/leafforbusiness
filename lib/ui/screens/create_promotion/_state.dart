part of 'create_promotion.dart';

class _ScreenState extends ChangeNotifier {
  _ScreenState({required Business bs}) {
    business = bs;
  }

  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  late Business business;
  XFile? image;

  final formKey = GlobalKey<FormBuilderState>();
  String? headline;
  String? notes;

  void setHeadline(String value) {
    headline = value;
    notifyListeners();
  }

  void setNotes(String value) {
    notes = value;
    notifyListeners();
  }

  void uploadImage() async {
    final picker = ImagePickerPlugin();
    final file = await picker.getImage(source: ImageSource.gallery);

    image = file;
    notifyListeners();
  }

  void resetImage() {
    image = null;
    notifyListeners();
  }

  double? price;

  void setPrice(int weekDays, int weekEnds) {
    /// $5 per weekday (Mon, Tue, Wed, Thu)
    /// $10 per weekend day (Fri, Sat, Sun)
    final weekDaysCharges = 5.0 * weekDays;
    final weekEndChanges = 10.0 * weekEnds;

    price = weekEndChanges + weekDaysCharges;
    notifyListeners();
  }

  /// Calendar
  final format = DateFormat('MM/dd/yyyy');
  final calendarFormat = CalendarFormat.month;
  final firstDate = DateTime.now().add(1.days);
  final lastDate = DateTime.now().add(365.days);
  DateTime focusedDay = DateTime.now().add(1.days);
  DateTime? selectedDay;
  DateTime? rangeStart = DateTime.now();
  DateTime? rangeEnd;
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOn;

  void resetCalendar() {
    price = null;
    selectedDay = null;
    rangeStart = DateTime.now();
    rangeEnd = null;
    rangeSelectionMode = RangeSelectionMode.toggledOn;
    focusedDay = DateTime.now().add(1.days);

    formKey.currentState?.fields[_FormKeys.startDate]?.didChange(null);
    formKey.currentState?.fields[_FormKeys.endDate]?.didChange(null);

    notifyListeners();
  }

  void onPageChanged(DateTime focusedDay) {
    this.focusedDay = focusedDay;

    notifyListeners();
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(this.selectedDay, this.focusedDay)) {
      this.selectedDay = selectedDay;
      this.focusedDay = focusedDay;
      rangeStart = null;
      rangeEnd = null;
      rangeSelectionMode = RangeSelectionMode.toggledOff;

      formKey.currentState?.fields[_FormKeys.startDate]?.didChange(null);
      formKey.currentState?.fields[_FormKeys.endDate]?.didChange(null);

      notifyListeners();
    }
  }

  void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    rangeStart = start;
    rangeEnd = end;
    this.focusedDay = focusedDay;
    selectedDay = null;

    final sStart = format.format(start!);
    formKey.currentState?.fields[_FormKeys.startDate]?.didChange(sStart);

    if (end != null) {
      final sEnd = format.format(end);
      formKey.currentState?.fields[_FormKeys.endDate]?.didChange(sEnd);

      /// Until ending date of promotion is selected, the price won't be calculated
      final range = DateTimeRange(start: start, end: end);
      final days = Utils.weekDaysAndWeekendCount(range);
      setPrice(days.first, days.last);
    }

    notifyListeners();
  }

  void reviewAndPay(BuildContext context) {
    final isValid = formKey.currentState!.saveAndValidate();
    if (!isValid) return;
    final form = formKey.currentState!;
    final data = form.value;
    final name = data[_FormKeys.name] as String;
    final email = data[_FormKeys.email] as String;
    final headline = data[_FormKeys.headline] as String?;
    final locationNotes = data[_FormKeys.note] as String?;
    final startDate = rangeStart!;
    final endDate = rangeEnd!;

    final paymentCubit = PaymentCubit.c(context);

    paymentCubit.checkout(
      price!,
      name,
      email,
      startDate,
      endDate,
      business,
      headline,
      locationNotes,
    );
  }
}
