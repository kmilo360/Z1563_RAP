@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Approver Consumption Travel'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZCD_C_TRAVEL_A_C as projection on ZCD_I_TRAVEL_C
{
    key TravelId,
    AgencyId,
    _Agency.Name as AgencyName,
    CustomerId,
    _Customer.LastName as CustomerName,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    CurrencyCode,
    Description,
    OverallStatus,
    //CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    CreatedAt,
    //LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    LastChangedAt,
    /* Associations */
    _Agency,
    _Booking : redirected to composition child zcd_c_booking_a_C,
    //_Currency,
    _Customer
}
