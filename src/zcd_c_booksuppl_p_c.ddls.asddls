@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZCD_C_BOOKSUPPL_P_C as projection on ZCD_I_BOOKSUPPL_C
{
   key TravelId,
   key BookingId,
   key BookingSupplementId,
   SupplementId,
   _SupplementText.Description as SupplementDescription: localized,
   @Semantics.amount.currencyCode: 'CurrencyCode'
   Price,
   CurrencyCode,
   LastChangedAt,
   /* Associations */
   _Booking : redirected to parent ZCD_C_BOOKING_P_C,
   //_Product,
   _SupplementText,
   _Travel : redirected to ZCD_C_TRAVEL_P_C
}
