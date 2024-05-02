# Payment Transaction Doc

This will store all the debit and credit information of a vendor.

- vendorId : int
- previousDocId : int
- nextDocId : int
- orderId : int
- fromTimestamp : int
- toTimestamp : int
- transactions: Array<{
  - timestamp : int
  - customerId : int
  - amount : int
  - direction: v2c | c2V
  - mode: online | offline
    }>

This info will help to generate the Account Stat.

# update PaymentTransactionDoc on OrderPayment | OrderRefund | WalletCredit | WalletDebit

# update VendorCouponDoc on OrderPlaced

Platform Firebase App Id
web 1:1065959458599:web:106223d96b629dec760b02
android 1:1065959458599:android:ddd29226d8249dc2760b02
ios 1:1065959458599:ios:d05ba1a51819356b760b02
macos 1:1065959458599:ios:d05ba1a51819356b760b02
windows 1:1065959458599:web:c2d2082510893aaa760b02
