class EditWeightViewModel {
  double? _weight;
  double? get weight => _weight;

  double? setWeight(String value) {
    // TODO(JJ): Add validation and exception handling.
    if (value.isEmpty) {
      _weight = null;
    }

    double intValue = double.parse(value);
    if (intValue == 0) {
      _weight = null;
    } else {
      _weight = intValue;
    }

    return weight;
  }
}