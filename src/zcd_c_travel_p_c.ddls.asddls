@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Consumption Procesor'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZCD_C_TRAVEL_P_C as projection on ZCD_I_TRAVEL_C
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
//CreatedAt,
//LastChangedBy,
LastChangedAt,
/* Associations */
_Agency,
_Booking : redirected to composition child ZCD_C_BOOKING_P_C,
//_Currency,
_Customer
    
}
