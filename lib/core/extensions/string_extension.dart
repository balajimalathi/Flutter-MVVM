import '../constants/app/app_contansts.dart';

extension StringLocalization on String? {
  String? get isValidEmail =>
      this!.contains(RegExp(ApplicationConstants.EMAIL_REGEX))
          ? null
          : "Email geçerli değil.";
}

extension ImagePathExtension on String {
  String get toSVG => "assets/svg/$this.svg";
}
