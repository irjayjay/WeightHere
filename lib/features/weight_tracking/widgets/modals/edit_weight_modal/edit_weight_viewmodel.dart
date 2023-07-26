/// Presentation logic for [EditWeightModal].
class EditWeightViewModel {
  final Function onTapAccept;
  final Function onTapCancel;

  EditWeightViewModel(this.onTapAccept, this.onTapCancel);

  void accept() => onTapAccept(weight);

  void cancel() => onTapCancel;

  double? _weight;
  double? get weight => _weight;
  double? setWeight(String value) {
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
