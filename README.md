#simplyweather

A smartphone app to get the weather for the next 8 hours.

To run the app you need to change the following three lines of Code:
lib/fetchdata.dart/line17: set your latitude
lib/fetchdata.dart/line18: set your longitude
lib/fetchdata.dart/line21: set your apikey (get it on: https://openweathermap.org/api/one-call-api)

Bugs / Info:
- If there are longer descriptions, they cannot be displayed because it would exceed the row length.
- If the wind speed is very high e.g. 100km/h, it cannot be displayed because it would exceed the row length.
- If the metrics would be changed to °F, maybe it cannot be displayed because it would exceed the row length.
- Only tested on Android.
- You will get some warnings and notes when you run the app (this happened when I upgraded flutter, couldn't figure out a solution atm).