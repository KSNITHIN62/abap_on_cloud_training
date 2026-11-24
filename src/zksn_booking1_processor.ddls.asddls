@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Entity Processor'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZKSN_BOOKING1_PROCESSOR as projection on ZKSN_BOOKING1
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _bookingstatus,
    _carrier,
    _connection,
    _customer,
    _suppl: redirected to composition child ZKSN_BOOKSUPPL_PROCESSOR,
    _travel: redirected to parent ZKSN_R_TRAVEL_PROCESSOR
}
