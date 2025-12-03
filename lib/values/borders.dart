part of 'values.dart';


class Borders {
  static const BorderSide defaultPrimaryBorder = BorderSide(
    width: 1.0,
    color: AppColors.primaryColor,
    style: BorderStyle.solid,
  );

  static const UnderlineInputBorder defaultUnderlineBorder = UnderlineInputBorder(
    borderSide: defaultPrimaryBorder,
  );

  static const OutlineInputBorder defaultOutlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius. circular(4.0)),
    borderSide: defaultPrimaryBorder,
  );
}
