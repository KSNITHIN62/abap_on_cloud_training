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
    
    @Consumption.valueHelpDefinition: [{  
    
      entity.name: '/DMO/I_Agency',
      entity.element: 'AgencyID'
    
    }]
    @ObjectModel.text.element: [ 'AgencyName' ]
    agency_id as AgencyId,
    
    _agency.Name as AgencyName,
    
    
    @Consumption.valueHelpDefinition: [{ 
      
      entity.name: '/DMO/I_Customer',
      entity.element: 'CustomerID'
     }]
    
    
    @ObjectModel.text.element: [ 'CustomerName' ]
    customer_id as CustomerId,
    
    concat(concat(_customer.FirstName, ''), _customer.LastName) as CustomerName,
    
    begin_date as BeginDate,
    
    end_date as EndDate,
    
    @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as BookingFee,
    
    @Semantics.amount.currencyCode: 'CurrencyCode'
    total_price as TotalPrice,
    
    currency_code as CurrencyCode,
    
    description as Description,
    
    
    @Consumption.valueHelpDefinition: [{ 
     entity.name: '/DMO/I_Overall_Status_VH',
     entity.element: 'OverallStatus'
     }]
    
    @ObjectModel.text.element: [ 'StatusText' ]
    overall_status as OverallStatus,
    
    _overallstatus._Text[ Language = $session.system_language].Text as StatusText,
    
    case overall_status
    when 'O' then 3
    when 'A' then 2
    when 'R' then 1
    else 0
    end as overallstatus1,
    
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    
    @Semantics.systemDateTime.createdAt: true
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
