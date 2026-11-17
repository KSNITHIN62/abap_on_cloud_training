@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Root Entity Processor'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define root view entity ZKSN_R_TRAVEL_PROCESSOR as projection on ZKSN_R_TRAVEL
{
    key TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    BookingFee,
    CustomerName,
    AgencyName,
    TotalPrice,
    CurrencyCode,
    Description,
    OverallStatus,
    overallstatus1,
    StatusText,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    /* Associations */
    _agency,
    _booking: redirected to composition child ZKSN_BOOKING1_PROCESSOR, 
    _currency,
    _customer,
    _overallstatus
}
