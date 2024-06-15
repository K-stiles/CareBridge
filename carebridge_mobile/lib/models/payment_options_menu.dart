import '../constants/app_images.dart';

class PaymentOptionsMenu {
  String label;
  String activeSvg;
  String inactiveSvg;

  PaymentOptionsMenu({
    required this.label,
    required this.activeSvg,
    required this.inactiveSvg,
  });
}

List<PaymentOptionsMenu> paymentOptions = [
  PaymentOptionsMenu(
    label: "Credit card",
    activeSvg: AppImages.card_primary,
    inactiveSvg: AppImages.card_inactive,
  ),
  PaymentOptionsMenu(
    label: "Insurance",
    activeSvg: AppImages.credit_card_primary,
    inactiveSvg: AppImages.credit_card_inactive,
  ),
  PaymentOptionsMenu(
    label: "Mobile Money",
    activeSvg: AppImages.empty_wallet_primary,
    inactiveSvg: AppImages.empty_wallet_inactive,
  ),
];
