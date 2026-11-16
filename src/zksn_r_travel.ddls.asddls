@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Travel'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define root view entity ZKSN_R_TRAVEL as select from /dmo/travel_m
composition [1..*] of ZKSN_BOOKING1 as _booking

association of one to one /DMO/I_Agency as _agency on
    $projection.AgencyId = _agency.AgencyID
    
association of one to one /DMO/I_Customer as _customer on 
    $projection.CustomerId = _customer.CustomerID
    
association of one to one I_Currency as _currency on
    $projection.CurrencyCode = _currency.Currency
    
association of one to one /DMO/I_Overall_Status_VH as _overallstatus on
    $projection.OverallStatus = _overallstatus.OverallStatus            
{
    key travel_id as TravelId,
    agency_id as AgencyId,
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    overall_status as OverallStatus,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    created_at as CreatedAt,
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
--    _association_name // Make association public
   
   _booking,
   _agency,
   _customer,
   _currency,
   _overallstatus
}
