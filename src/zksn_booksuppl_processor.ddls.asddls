@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Suppliment Processor'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZKSN_BOOKSUPPL_PROCESSOR as projection on ZKSN_BOOKSUPPL
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _booking: redirected to parent ZKSN_BOOKING1_PROCESSOR,
    _supplement,
    _supplementtext,
    _travel: redirected to ZKSN_R_TRAVEL_PROCESSOR
}
