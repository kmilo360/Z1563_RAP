@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Approver Consumption Booking'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zcd_c_booking_a_C as projection on ZCD_I_BOOKING_C
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
    //_BookSupplement,
    //_Connection,
    _Customer,
    _Travel : redirected to parent ZCD_C_TRAVEL_A_C,
    _Carrier
}
