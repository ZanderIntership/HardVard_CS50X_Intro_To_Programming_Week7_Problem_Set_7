-- Keep a log of any SQL queries you execute as you solve the mystery.
-- PART 1
SELECT description FROM crime_scene_reports WHERE day = 28 AND month = 7 AND year = 2024 AND street = 'Humphrey Street';

-- Theft Took place on 10:15 AM

--PArt 2

SELECT name,transcript FROM interviews WHERE day = 28 AND month = 7 AND year = 2024;

-- Take the earliest flight out if fiftyville, was on a phone call ( Phone call less then a minute )
-- Before Emmas backery the thief withdrew some money
-- Between 10:15AM and 10:25AM ( got into a car at the backer and drove awaay, BARBARA )
-- Before Ruth arrived at Emmas backer he saw the thief at the ATM on Leggett Street

Select caller,reciever FROM phone_calls WHERE day = 28 AND month = 7 AND year = 2024 AND duration < 60

-- ??

SELECT Acitivity,licence_plate,minute FROM bakery_Security_logs WHERE day = 28 AND month = 7 AND year = 2024 AND hour = 10 AND minute < 30 ORDER BY minute DESC;

-- SUSEPCT LICENSE PLATES : 322W7JE ( IMAN - (829) 555-5269), 0NTHK55 ( Sofia - (130) 555-0289), L93JTIZ ( Diana (770) 555-1861), G412CB7 ( Kelsey (499) 555-9472)


-- Narrowed down suspects : Sofia, DIANA, KELSEY
-- SOFIA CALLED (996) 555-8899 ( Passport : 1695452385) ( FLIGHT ID = 36 AND SEAT = 3B)
-- Diana Called (725) 555-3243 ( Passport : 3592750733) ( FLIGHT ID = 18,24,54)
-- Kelsey Called 2x (892) 555-8872 ( Passport : 8294398571) ( FLIGHT ID = 36 AND SEAT = 6C)


-- Okay so its Sofia or Kelsey

-- Combine phone calls, passport, and flight info for remaining suspects
SELECT 
    s.name AS suspect_name,
    s.passport AS passport_number,
    f.flight_id,
    f.seat,
    c.duration AS call_duration,
    c.receiver AS call_receiver
FROM suspects s
JOIN flights f ON s.passport = f.passport
JOIN phone_calls c ON s.phone_number = c.caller
WHERE s.name IN ('Sofia', 'Kelsey')
  AND c.day = 28 AND c.month = 7 AND c.year = 2024
  AND c.duration < 60
ORDER BY f.flight_id, f.seat;
