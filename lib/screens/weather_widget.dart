import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/location_service.dart';
import '../services/weather.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final WeatherService weatherService = WeatherService();
  final LocationService locationService = LocationService();
  Weather? _weather;
  bool _isLoading = false;
  final TextEditingController _controller = TextEditingController();

  Future<void> _fetchWeather() async {
    setState(() {
      _isLoading = true;
    });
    try {
      String cityName = await locationService.getCityName();
      final weatherData = await weatherService.fetchWeather(cityName);
      setState(() {
        _weather = Weather.fromJson(weatherData);
      });
    } catch (e) {
      // Handle error
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 250.0.r),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(60.w, 50.h),
                backgroundColor: const Color(0xFF54796E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              onPressed: _fetchWeather,
              child: Text(
                'Get Weather',
                style: TextStyle(
                    color: const Color.fromARGB(255, 252, 255, 254),
                    fontSize: 20.sp),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          _isLoading
              ? CircularProgressIndicator()
              : _weather != null
                  ? Container(
                      width: 350.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                          color: const Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(35.r)),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 20.0.r,
                              bottom: 10.r,
                              right: 210.r,
                            ),
                            child: Text(
                              '${_weather!.temperature}°C',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 30.sp),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 5.0.r,
                              bottom: 10.r,
                              right: 150.r,
                            ),
                            child: Text('${_weather!.city}',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400)),
                          ),
                          Text(
                            '${_weather!.condition}',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w700,
                                fontSize: 25.sp),
                          ),
                        ],
                      ),
                    )
                  : Container(),
        ],
      ),
    );
  }
}
