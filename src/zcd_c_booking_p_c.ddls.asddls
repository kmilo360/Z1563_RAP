@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZCD_C_BOOKING_P_C
  as projection on ZCD_I_BOOKING_C
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      _Carrier.Name as CarrierName,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      _Travel : redirected to parent ZCD_C_TRAVEL_P_C,
      _BookSupplement : redirected to composition child ZCD_C_BOOKSUPPL_P_C,
      _Customer,
      _Carrier
      //_Connection,    
}
