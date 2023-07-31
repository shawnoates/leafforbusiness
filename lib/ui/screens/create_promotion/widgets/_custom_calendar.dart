part of '../create_promotion.dart';

class _CustomCalendar extends StatelessWidget {
  const _CustomCalendar();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final screenState = _ScreenState.s(context, true);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 140.un(),
          // height: Responsive.isMobile() ? 180.un() : 140.un(),
          padding: Space.h.t20,
          color: Colors.white,
          child: TableCalendar(
            calendarFormat: screenState.calendarFormat,
            focusedDay: screenState.focusedDay,
            firstDay: screenState.firstDate,
            lastDay: screenState.lastDate,
            currentDay: screenState.selectedDay,
            rangeSelectionMode: screenState.rangeSelectionMode,
            rangeStartDay: screenState.rangeStart,
            rangeEndDay: screenState.rangeEnd,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
            ),
            onPageChanged: screenState.onPageChanged,
            onDaySelected: screenState.onDaySelected,
            onRangeSelected: screenState.onRangeSelected,
            calendarBuilders: CalendarBuilders(
              todayBuilder: (context, day, focusedDay) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      day.day.toString(),
                    ),
                    Space.y.t05,
                    Text(
                      Utils.isWeekDay(day) ? '\$5' : '\$10',
                      style: AppText.s2,
                    )
                  ],
                );
              },
              withinRangeBuilder: (context, day, focusedDay) {
                return Container(
                  alignment: Alignment.center,
                  color: AppTheme.green.withAlpha(50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        day.day.toString(),
                      ),
                      Space.y.t05,
                      Text(
                        Utils.isWeekDay(day) ? '\$5' : '\$10',
                        style: AppText.s2,
                      )
                    ],
                  ),
                );
              },
              rangeHighlightBuilder: (context, day, isWithinRange) {
                return Container(
                  alignment: isWithinRange ? Alignment.center : null,
                  color: isWithinRange
                      ? AppTheme.green.withAlpha(50)
                      : Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        day.day.toString(),
                      ),
                      Space.y.t05,
                      Text(
                        Utils.isWeekDay(day) ? '\$5' : '\$10',
                        style: AppText.s2,
                      )
                    ],
                  ),
                );
              },
              rangeEndBuilder: (context, day, focusedDay) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppTheme.green,
                    borderRadius: 8.radius(),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        day.day.toString(),
                        style: AppText.s1 + Colors.white,
                      ),
                      Space.y.t05,
                      Text(
                        Utils.isWeekDay(day) ? '\$5' : '\$10',
                        style: AppText.s2 + Colors.white,
                      )
                    ],
                  ),
                );
              },
              rangeStartBuilder: (context, day, focusedDay) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppTheme.green,
                    borderRadius: 8.radius(),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        day.day.toString(),
                        style: AppText.s1 + Colors.white,
                      ),
                      Space.y.t05,
                      Text(
                        Utils.isWeekDay(day) ? '\$5' : '\$10',
                        style: AppText.s2 + Colors.white,
                      )
                    ],
                  ),
                );
              },
              defaultBuilder: (context, day, focusedDay) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      day.day.toString(),
                    ),
                    Space.y.t05,
                    Text(
                      Utils.isWeekDay(day) ? '\$5' : '\$10',
                      style: AppText.s2,
                    )
                  ],
                );
              },
            ),
          ),
        ),
        Space.y.t10,
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              style: AppButtonStyle.white,
              state: screenState.rangeEnd == null
                  ? AppButtonState.disabled
                  : AppButtonState.elevated,
              width: 55.un(),
              height: 18.un(),
              label: 'Reset',
              onPressed: () {
                screenState.resetCalendar();
                ''.pop(context);
              },
            ),
            Space.x.t20,
            AppButton(
              width: 55.un(),
              height: 18.un(),
              label: 'Apply',
              onPressed: () {
                ''.pop(context);
              },
            ),
          ],
        ),
        Space.y.t30,
      ],
    );
  }
}
