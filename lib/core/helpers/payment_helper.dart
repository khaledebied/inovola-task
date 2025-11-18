import 'package:moyasar/moyasar.dart';

class MoyasarPaymentHelper {
  final String publishableApiKey;
  final String merchantId;
  final String storeName;

  MoyasarPaymentHelper({
    this.publishableApiKey = 'pk_test_sQTaqT9CsiKFSFg6ymDPFCXPRs67XVBoLsSiJrZc',
    this.merchantId = 'merchant.com.tracker.app',
    this.storeName = 'Foz',
  });

  /// Create a PaymentConfig for both Credit Card & Apple Pay
  PaymentConfig createPaymentConfig({
    required int amount, // Amount in Halalas (1 SAR = 100 Halalas)
    required String description,
    Map<String, dynamic>? metadata,
  }) {
    return PaymentConfig(
      publishableApiKey: publishableApiKey,
      amount: amount,
      description: description,
      metadata: metadata ?? {'size': '250g'},
      creditCard: CreditCardConfig(saveCard: true, manual: false),
      applePay: ApplePayConfig(
        merchantId: merchantId,
        label: storeName,
        manual: false,
      ),
    );
  }

  /// Handle the payment result
  void handlePaymentResult(
    dynamic result, {
    required Function(PaymentResponse) onPaid,
    required Function(PaymentResponse) onFailed,
    Function(PaymentResponse)? onInitiated,
    Function(PaymentResponse)? onAuthorized,
    Function(PaymentResponse)? onCaptured,
  }) {
    if (result is PaymentResponse) {
      switch (result.status) {
        case PaymentStatus.paid:
          onPaid(result);
          break;
        case PaymentStatus.failed:
          onFailed(result);
          break;
        case PaymentStatus.initiated:
          if (onInitiated != null) onInitiated(result);
          break;
        case PaymentStatus.authorized:
          if (onAuthorized != null) onAuthorized(result);
          break;
        case PaymentStatus.captured:
          if (onCaptured != null) onCaptured(result);
          break;
      }
    }
  }

  /// Process Apple Pay submission
  Future<void> onSubmitApplePay(
    dynamic applePay,
    PaymentConfig paymentConfig,
    Function(dynamic) onPaymentResult,
  ) async {
    try {
      final source = ApplePayPaymentRequestSource(
        applePay['token'],
        (paymentConfig.applePay as ApplePayConfig).manual,
      );

      final paymentRequest = PaymentRequest(paymentConfig, source);

      final result = await Moyasar.pay(
        apiKey: paymentConfig.publishableApiKey,
        paymentRequest: paymentRequest,
      );

      onPaymentResult(result);
    } catch (e) {
      print("❌ Error processing Apple Pay: $e");
    }
  }

  /// Process Credit Card submission
  Future<void> onSubmitCcForm({
    required String name,
    required String cardNumber,
    required String expiryMonth,
    required String expiryYear,
    required PaymentConfig paymentConfig,
    required Function(dynamic) onPaymentResult,
  }) async {
    try {
      final source = CardPaymentRequestSource(
        creditCardData: CardFormModel(
          name: name,
          number: cardNumber,
          month: expiryMonth,
          year: expiryYear,
        ),
        tokenizeCard: (paymentConfig.creditCard as CreditCardConfig).saveCard,
        manualPayment: (paymentConfig.creditCard as CreditCardConfig).manual,
      );

      final paymentRequest = PaymentRequest(paymentConfig, source);

      final result = await Moyasar.pay(
        apiKey: paymentConfig.publishableApiKey,
        paymentRequest: paymentRequest,
      );

      onPaymentResult(result);
    } catch (e) {
      print("❌ Error processing Credit Card Payment: $e");
    }
  }
}

//usage
/*
final moyasarHelper = MoyasarPaymentHelper(
  publishableApiKey: "YOUR_API_KEY",
  merchantId: "YOUR_MERCHANT_ID",
  storeName: "YOUR_STORE_NAME",
);

final paymentConfig = moyasarHelper.createPaymentConfig(
  amount: 5000, // 50 SAR (amount is in Halalas)
  description: "Order #1234",
);

void handleCreditCardSubmission() {
  moyasarHelper.onSubmitCcForm(
    name: "John Doe",
    cardNumber: "4111111111111111",
    expiryMonth: "05",
    expiryYear: "2025",
    paymentConfig: paymentConfig,
    onPaymentResult: (result) => moyasarHelper.handlePaymentResult(
      result,
      onPaid: (payment) => print("✅ Payment Successful: ${payment.id}"),
      onFailed: (payment) => print("❌ Payment Failed: ${payment.id}"),
    ),
  );
}

 */
