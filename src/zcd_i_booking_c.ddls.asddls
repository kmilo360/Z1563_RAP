@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking View'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZCD_I_BOOKING_C
  as select from ztb_booking_c as Booking
  association to parent ZCD_I_TRAVEL_C as _Travel     on  $projection.TravelId = _Travel.TravelId
  composition [0..*] of ZCD_I_BOOKSUPPL_C     as _BookSupplement
  association [1..1] to /DMO/I_Customer       as _Customer   on  $projection.CustomerId = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier        as _Carrier    on  $projection.CarrierId = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection     as _Connection on  $projection.CarrierId    = _Connection.AirlineID
                                                             and $projection.ConnectionId = _Connection.ConnectionID
{
  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      customer_id     as CustomerId,
      carrier_id      as CarrierId,
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price    as FlightPrice,
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      last_changed_at as LastChangedAt,
      _Travel,
      _BookSupplement,
      _Customer,
      _Carrier,
      _Connection
}
