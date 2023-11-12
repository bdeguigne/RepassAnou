import 'package:flutter/material.dart';
import 'package:repasse_anou/design_system/custom_drop_down.dart';
import 'package:repasse_anou/design_system/drop_down.dart';

class CustomDropdownFormField<T> extends FormField<T> {
  const CustomDropdownFormField._({
    Key? key,
    T? initialValue,
    required String Function(T item) selectedLabelBuilder,
    FormFieldSetter<T>? onSaved,
    FormFieldValidator<T>? validator,
    bool autovalidate = false,
    required Widget Function(FormFieldState<T>) builder,
  }) : super(
          key: key,
          initialValue: initialValue,
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          builder: builder,
        );

  factory CustomDropdownFormField.single({
    Key? key,
    required List<AppDropdownMenuItem<T>> items,
    required String Function(T item) selectedLabelBuilder,
    T? initialValue,
    required String hint,
    FormFieldSetter<T>? onSaved,
    FormFieldValidator<T>? validator,
    bool autovalidate = false,
    final void Function(T?)? onChanged,
  }) {
    return CustomDropdownFormField<T>._(
      key: key,
      builder: (field) {
        final _DropdownFormFieldState<T> state =
            field as _DropdownFormFieldState<T>;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropdown<T>.single(
              items: items,
              initialValue: initialValue,
              selectedLabelBuilder: selectedLabelBuilder,
              hint: hint,
              isError: state.hasError,
              onChanged: (T? newValue) {
                if (newValue != null) {
                  field.didChange(newValue);
                  if (onChanged != null) {
                    onChanged(newValue);
                  }
                }
              },
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                child: Text(
                  field.errorText ?? '',
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
      initialValue: initialValue,
      selectedLabelBuilder: selectedLabelBuilder,
      onSaved: onSaved,
      validator: validator,
      autovalidate: autovalidate,
    );
  }

  factory CustomDropdownFormField.multiple({
    Key? key,
    required List<AppDropdownMenuItem<T>> items,
    required String Function(T item) selectedLabelBuilder,
    List<T>? initialValues,
    required String hint,
    FormFieldSetter<T>? onSaved,
    FormFieldValidator<T>? validator,
    bool autovalidate = false,
    final void Function(List<T?>)? onChanged,
  }) {
    return CustomDropdownFormField<T>._(
      key: key,
      builder: (field) {
        final _DropdownFormFieldState<T> state =
            field as _DropdownFormFieldState<T>;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropdown<T>.multiple(
              items: items,
              initialValues: initialValues,
              selectedLabelBuilder: selectedLabelBuilder,
              hint: hint,
              onChanged: (List<T?>? newValue) {
                if (newValue != null) {
                  field.didChange(newValue.firstOrNull);
                  if (onChanged != null) {
                    onChanged(newValue);
                  }
                }
              },
              isError: state.hasError,
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                child: Text(
                  field.errorText ?? '',
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
      initialValue: initialValues?.firstOrNull,
      selectedLabelBuilder: selectedLabelBuilder,
      onSaved: onSaved,
      validator: validator,
      autovalidate: autovalidate,
    );
  }

  factory CustomDropdownFormField.input({
    Key? key,
    required List<AppDropdownMenuItem<T>> items,
    required String Function(T item) selectedLabelBuilder,
    T? initialValue,
    required String hint,
    FormFieldSetter<T>? onSaved,
    FormFieldValidator<T>? validator,
    bool autovalidate = false,
    final void Function(T?)? onChanged,
    String? inputButtonText,
    String? inputHint,
    void Function(String value)? onValidInputPressed,
  }) {
    return CustomDropdownFormField<T>._(
      key: key,
      builder: (field) {
        final _DropdownFormFieldState<T> state =
            field as _DropdownFormFieldState<T>;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropdown<T>.input(
              items: items,
              initialValue: initialValue,
              selectedLabelBuilder: selectedLabelBuilder,
              hint: hint,
              inputButtonText: inputButtonText,
              inputHint: inputHint,
              onValidInputPressed: onValidInputPressed,
              onChanged: (T? newValue) {
                if (newValue != null) {
                  field.didChange(newValue);
                  if (onChanged != null) {
                    onChanged(newValue);
                  }
                }
              },
              isError: state.hasError,
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                child: Text(
                  field.errorText ?? '',
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
      initialValue: initialValue,
      selectedLabelBuilder: selectedLabelBuilder,
      onSaved: onSaved,
      validator: validator,
      autovalidate: autovalidate,
    );
  }

  @override
  FormFieldState<T> createState() => _DropdownFormFieldState<T>();
}

class _DropdownFormFieldState<T> extends FormFieldState<T> {
  // @override
  // void validate() {
  //   super.validate();
  //   // Vous pouvez ajouter une logique supplémentaire de validation ici si nécessaire
  // }
}
