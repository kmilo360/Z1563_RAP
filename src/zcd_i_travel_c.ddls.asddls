@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCD_I_TRAVEL_C
  as select from ztb_travel_c as Travel
  composition [0..*] of ZCD_I_BOOKING_C as _Booking
  association [0..1] to /DMO/I_Agency   as _Agency   on $projection.AgencyId = _Agency.AgencyID
 association [0..1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID
 association [0..1] to I_Currency      as _Currency on $projection.CurrencyCode = _Currency.Currency
{
  key Travel.travel_id       as TravelId,
      Travel.agency_id       as AgencyId,
      Travel.customer_id     as CustomerId,
      Travel.begin_date      as BeginDate,
      Travel.end_date        as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Travel.booking_fee     as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Travel.total_price     as TotalPrice,

      Travel.currency_code   as CurrencyCode,
      Travel.description     as Description,
      Travel.overall_status  as OverallStatus,
      @Semantics.user.createdBy: true
      Travel.created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      Travel.created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      Travel.last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      Travel.last_changed_at as LastChangedAt,
      _Booking,
      _Agency,
      _Customer,
      _Currency


}
