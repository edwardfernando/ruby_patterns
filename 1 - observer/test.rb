require './weather_data'
require './current_display'
require './statistics_display'
require 'test/unit'

class WeatherDataTest < Test::Unit::TestCase

	def test_accessors
		weather_data = WeatherData.new
		weather_data.set_measurements(25, 30, 100)
		assert_equal(25, weather_data.temperature)
		assert_equal(30, weather_data.humidity)
		assert_equal(100, weather_data.pressure)
	end

	def test_subscribe_and_unsubscribe
		weather_data = WeatherData.new
		current_display = CurrentDisplay.new
    current_display.subscribe(weather_data)
		assert_equal(1, weather_data.count_observers)
		current_display.unsubscribe(weather_data);
		assert_equal(0, weather_data.count_observers)
	end

	def test_current_display
		weather_data = WeatherData.new
		current_display = CurrentDisplay.new
    current_display.subscribe(weather_data)
		weather_data.set_measurements(20.0, 30.0, 40.0)
		assert_equal("Current conditions: 20.0C degrees and 30.0% humidity", current_display.to_s)
		weather_data.set_measurements(21.0, 31.0, 41.0)
		assert_equal("Current conditions: 21.0C degrees and 31.0% humidity", current_display.to_s)
	end

	def test_statistics_display
		weather_data = WeatherData.new
		stats_display = StatisticsDisplay.new
    stats_display.subscribe(weather_data)
		weather_data.set_measurements(20.0, 30.0, 40.0)
		assert_equal("Avg/Max/Min temperature: 20.0/20.0/20.0", stats_display.to_s)
		weather_data.set_measurements(21.0, 31.0, 41.0)
		assert_equal("Avg/Max/Min temperature: 20.5/21.0/20.0", stats_display.to_s)
	end
end
