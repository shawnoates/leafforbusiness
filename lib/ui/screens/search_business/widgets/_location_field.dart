part of '../search_business.dart';

class _LocationField extends StatelessWidget {
  const _LocationField();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final screenState = _ScreenState.s(context, true);
    final cityCubit = CitiesCubit.cubit(context);

    return SizedBox(
      width: 200.un(),
      child: FormBuilderField(
          name: _FormKeys.location,
          builder: (field) {
            return Autocomplete<City>(
              displayStringForOption: (option) => option.city.titleCase,
              onSelected: (option) => field.didChange(option),
              fieldViewBuilder: (context, textEditingController, focusNode,
                  onFieldSubmitted) {
                return AppInputField(
                  node: focusNode,
                  controller: textEditingController,
                  name: 'location-f',
                  prefixIcon: const Icon(Icons.pin_drop),
                  hint: "City, State...",
                  validator: FormBuilderValidators.required(
                    errorText: 'Location cannot be empty!',
                  ),
                  onSubmitted: (value) {
                    if (value != null && value.isNotEmpty) {
                      focusNode.requestFocus();
                    }
                  },
                  suffixIcon: screenState.cityLoading
                      ? Container(
                          height: 18.un(),
                          width: 18.un(),
                          padding: Space.a.t20,
                          child: const CircularProgressIndicator(
                            color: AppTheme.green,
                          ),
                        )
                      : null,
                  onChanged: (value) => screenState.onCityChange(value),
                );
              },
              optionsBuilder: (textEditingValue) async {
                try {
                  if (textEditingValue.text.length > 2) {
                    screenState.setCityLoading(true);
                    List<City>? cities = cityCubit.state.data;

                    if (cities == null) {
                      await cityCubit.get();
                    }

                    screenState.setCityLoading(false);

                    final filtered = cities!
                        .where((element) => element.city
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase()))
                        .toList();

                    if (filtered.isEmpty) {
                      screenState.setCities(true);
                      return const Iterable<City>.empty();
                    }

                    return filtered;
                  }
                  screenState.setCityLoading(false);
                  return const Iterable<City>.empty();
                } catch (e) {
                  debugPrint('--->> $e');
                  screenState.setCityLoading(false);
                  return const Iterable<City>.empty();
                }
              },
              optionsViewBuilder: (context, onSelected, options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4.0,
                    child: SizedBox(
                      height: 250.0,
                      width: 200.un(),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8.0),
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final option = options.elementAt(index);
                          return GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              onSelected(option);
                            },
                            child: ListTile(
                              title: Text(option.city.titleCase),
                              subtitle: Text(option.state.titleCase),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
