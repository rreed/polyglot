{-
    You are given the following information, but you may prefer to do some research for yourself.

    1 Jan 1900 was a Monday.
    Thirty days has September,
    April, June and November.
    All the rest have thirty-one,
    Saving February alone,
    Which has twenty-eight, rain or shine.
    And on leap years, twenty-nine.
    A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
    
    How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

    Usage: elm reactor -a localhost, visit localhost:8000 in a browser
-}

import Graphics.Element exposing (show)
import Date

isSunday : (Int,Int) -> Bool
isSunday datePair =
  let 
    month = fst datePair
    year = snd datePair

    {-
      Why my original answer was off by four: 2000-10-1 is a Sunday, 2000-10-01 is a Saturday??
      Apparently also true in JS:
      > new Date("2000-10-1")
      < Sun Oct 01 2000 00:00:00 GMT-0700 (PDT)
      > new Date("2000-10-01")
      < Sat Sep 30 2000 17:00:00 GMT-0700 (PDT)
    -}

    dateString = (toString year) ++ "-" ++ (toString month) ++ "-1"
    date = Date.fromString dateString |> Result.withDefault (Date.fromTime 0)
  in
    Date.dayOfWeek date == Date.Sun

-- build a list of (month-as-integer, year-as-integer) pairs for every year between `year` and 2001
yearTuples : Int -> List (number,number') -> List (number,number')
yearTuples year list =
  case year of
    2001 ->
      list
    _ ->
     -- there has to be a more Elm-y way to do this...
     -- some foo where foo [1,2,3] [4,5,6] == [(1,4),(1,5),(1,6),(2,4)...]

     yearTuples (year + 1) (List.append list [(1,year),(2,year),(3,year),(4,year),(5,year),(6,year),(7,year),(8,year),(9,year),(10,year),(11,year),(12,year)])

main =
  let
    dates = yearTuples 1901 []
  in
    show (List.length (List.filter isSunday dates))
