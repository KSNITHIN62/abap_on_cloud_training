@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZKSN_BOOKING1 as select from /dmo/booking_m

composition [1..*] of ZKSN_BOOKSUPPL as _suppl

association to parent ZKSN_R_TRAVEL as _travel on
    $projection. TravelId = _travel.TravelId

association of one to one /DMO/I_Customer as _customer on
    $projection.CustomerId = _customer.CustomerID
    
association of one to one /DMO/I_Carrier as _carrier on
    $projection.CarrierId = _carrier.AirlineID
    
association of one to one /DMO/I_Connection as _connection on
    $projection.CarrierId = _connection.AirlineID and
    $projection.ConnectionId = _connection.ConnectionID
    
association of one to one /DMO/I_Booking_Status_VH as _bookingstatus on
    $projection.BookingStatus = _bookingstatus.BookingStatus    
             
//composition of target_data_source_name as _association_name
{

key travel_id as TravelId,
key booking_id as BookingId,
booking_date as BookingDate,

@Consumption.valueHelpDefinition: [{ 
entity.name: '/DMO/I_Customer',
entity.element: 'CustomerID'

 }]
 
customer_id as CustomerId,

@Consumption.valueHelpDefinition: [{ 
entity.name: '/DMO/I_Carrier',
entity.element: 'AirlineID'
 }]
carrier_id as CarrierId,

@Consumption.valueHelpDefinition: [{ 
entity:{ name: '/DMO/I_Connection' ,
        element: 'ConnectionID' },
        
        additionalBinding: [{ 
        
        localElement: 'CarrierId' ,
        element: 'AirlineID'}]
        
 }]
connection_id as ConnectionId,
flight_date as FlightDate,
@Semantics.amount.currencyCode: 'CurrencyCode'
flight_price as FlightPrice,
currency_code as CurrencyCode,
booking_status as BookingStatus,
@Semantics.systemDateTime.lastChangedAt: true
last_changed_at as LastChangedAt,

_suppl,
_travel,
_customer,
_carrier,
_connection,
_bookingstatus
    
//    _association_name // Make association public
}
