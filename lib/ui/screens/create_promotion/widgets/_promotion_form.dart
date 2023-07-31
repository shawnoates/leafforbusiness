part of '../create_promotion.dart';

class _PromotionForm extends StatelessWidget {
  const _PromotionForm();

  @override
  Widget build(BuildContext context) {
    final paymentCubit = PaymentCubit.c(context, true);
    final screenState = _ScreenState.s(context, true);

    return Container(
      padding: Space.a.t30,
      decoration: BoxDecoration(
        borderRadius: 8.radius(),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 6,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Please fill the following details:',
            style: AppText.b2 + FontWeight.w700,
          ),
          Space.y.t20,
          const _FileDropZone(
            label: 'Upload Header Image',
          ),
          Space.y.t20,
          AppInputField(
            onTap: () async {
              await showDialog(
                  context: context,
                  builder: (_) {
                    return ListenableProvider.value(
                      value: screenState,
                      child: Dialog(
                        child: ClipRRect(
                          borderRadius: 12.radius(),
                          child: const _CustomCalendar(),
                        ),
                      ),
                    );
                  });
            },
            label: 'Promotion Dates',
            prefixIcon: const Icon(Icons.date_range),
            name: _FormKeys.startDate,
            hint: 'Starting date',
            validator: FormBuilderValidators.required(
                errorText: 'Starting date cannot be empty'),
          ),
          Space.y.t20,
          AppInputField(
            onTap: () async {
              await showDialog(
                  context: context,
                  builder: (_) {
                    return ListenableProvider.value(
                      value: screenState,
                      child: Dialog(
                        child: ClipRRect(
                          borderRadius: 12.radius(),
                          child: const _CustomCalendar(),
                        ),
                      ),
                    );
                  });
            },
            prefixIcon: const Icon(Icons.date_range_outlined),
            name: _FormKeys.endDate,
            hint: 'Ending date',
            validator: FormBuilderValidators.required(
                errorText: 'Ending date cannot be empty'),
          ),
          Space.y.t20,
          AppInputField(
            label: 'Add Headline',
            maxCharacters: 100,
            subtitle: 'Craft an irresistible offer for our users.',
            name: _FormKeys.headline,
            hint: 'Join us for Happy Hour every Wednesday from 5 - 6 pm',
            onChanged: (value) {
              if (value != null) {
                screenState.setHeadline(value);
              }
            },
          ),
          Space.y.t20,
          AppMultilineInputField(
            label: 'Location Notes',
            subtitle:
                'What additional details would you like our users to know about your location?',
            name: _FormKeys.note,
            hint: 'Don\'t forget to submit a review!',
            maxLength: 250,
            onChanged: (value) {
              if (value != null) {
                screenState.setNotes(value);
              }
            },
          ),
          Divider(
            height: 10.un(),
          ),
          AppInputField(
            name: _FormKeys.email,
            label: 'Email Address',
            prefixIcon: const Icon(Icons.email),
            hint: 'someone@example.com',
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.email(),
              FormBuilderValidators.required(
                  errorText: 'Email address cannot be empty!'),
            ]),
          ),
          Space.y.t20,
          AppInputField(
            name: _FormKeys.name,
            label: 'Full Name',
            prefixIcon: const Icon(Icons.person),
            hint: 'John Doe',
            validator: FormBuilderValidators.required(
                errorText: 'Name cannot be empty!'),
          ),
          Space.y.t30,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              screenState.price == null
                  ? const SizedBox.shrink()
                  : Text(
                      'Total: \$${screenState.price}',
                      style: AppText.b2,
                    ),
              AppButton(
                state: paymentCubit.state.checkout is CheckoutLoading
                    ? AppButtonState.disabled
                    : AppButtonState.plain,
                width: 70.un(),
                label: 'Review & Pay',
                onPressed: () => screenState.reviewAndPay(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
