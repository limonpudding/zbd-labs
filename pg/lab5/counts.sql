(SELECT 'aircrafts_data', count(*) FROM aircrafts_data) UNION ALL
(SELECT 'airports_data', count(*) FROM airports_data) UNION ALL
(SELECT 'boarding_passes', count(*) FROM boarding_passes) UNION ALL
(SELECT 'bookings', count(*) FROM bookings) UNION ALL
(SELECT 'flights', count(*) FROM flights) UNION ALL
(SELECT 'seats', count(*) FROM seats) UNION ALL
(SELECT 'ticket_flights', count(*) FROM ticket_flights) UNION ALL
(SELECT 'tickets', count(*) FROM tickets);