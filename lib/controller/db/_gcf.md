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
