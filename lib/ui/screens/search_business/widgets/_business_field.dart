part of '../search_business.dart';

class _BusinessField extends StatelessWidget {
  const _BusinessField();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final screenState = _ScreenState.s(context, true);

    return SizedBox(
      width: 200.un(),
      child: FormBuilderField(
          name: _FormKeys.searchBusiness,
          builder: (field) {
            return Autocomplete<Business>(
              displayStringForOption: (option) => option.name.titleCase,
              onSelected: (option) => field.didChange(option),
              fieldViewBuilder: (context, textEditingController, focusNode,
                  onFieldSubmitted) {
                return AppInputField(
                  node: focusNode,
                  controller: textEditingController,
                  name: 'search',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: screenState.loading
                      ? Container(
                          height: 18.un(),
                          width: 18.un(),
                          padding: Space.a.t20,
                          child: const CircularProgressIndicator(
                            color: AppTheme.green,
                          ),
                        )
                      : null,
                  hint: 'Search business name...',
                  validator: FormBuilderValidators.required(),
                  onChanged: (value) => screenState.onChange(value),
                  onSubmitted: (value) {
                    if (value != null && value.isNotEmpty) {
                      focusNode.requestFocus();
                    }
                  },
                );
              },
              optionsBuilder: (textEditingValue) async {
                if (textEditingValue.text.length > 3) {
                  screenState.setLoading(true);

                  screenState.formKey.currentState!.saveAndValidate();
                  final form = screenState.formKey.currentState!;
                  final formData = form.value;
                  final location = formData[_FormKeys.location] as City?;

                  debugPrint('----> $location <-----');

                  final res = await Api.ins.post(
                    '/business-search',
                    data: {
                      'term': textEditingValue.text,
                      'location': location?.city,
                    },
                  );
                  final data = res.data as Map<String, dynamic>;

                  if (data['results'] == null) {
                    screenState.setResults(true);
                    return const Iterable<Business>.empty();
                  }

                  final businessResponse = BusinessSearchResponse.fromMap(
                    data['results']['data'] as Map<String, dynamic>,
                  );

                  screenState.setLoading(false);

                  return businessResponse.businesses;
                }
                screenState.setLoading(false);

                return const Iterable<Business>.empty();
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
                              title: Text(option.name.titleCase),
                              subtitle: Text(option.location.address1),
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
