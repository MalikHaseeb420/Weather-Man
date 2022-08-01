require 'date'
require 'colortheme'
module YearHighestTemperatue
  class YearHighestTemperatueClass
    def self.year_highest_temp_day(file_name, year, max_temperature = 20, date = '2000-01-01')
      files = Dir["#{file_name}/**"]
      year_weather_files = files.map { |file| file if file.include? "#{file_name}_#{year}" }.compact!
      year_weather_files.each do |file|
        File.open(file, 'r') do |opened_file|
          opened_file.readline
          max_temp_index = opened_file.readline.split(',').find_index('Max TemperatureC')
          lines = opened_file.readlines
          lines.each do |line|
            next if line.split(',')[max_temp_index].nil?

            if line.split(',')[max_temp_index].to_i > max_temperature
              max_temperature = line.split(',')[max_temp_index].to_i
              date = line.split(',')[0]
            end
          end
        end
      end
      "Highest : #{max_temperature}C on #{Date.parse(date).strftime('%B %a')}"
    end

    def self.year_lowest_temp_day(file_name, year, min_temperature = 20, date = '2000-01-01')
      files = Dir["#{file_name}/**"]
      year_weather_files = files.map { |file| file if file.include? "#{file_name}_#{year}" }.compact!
      year_weather_files.each do |file|
        File.open(file, 'r') do |opened_file|
          opened_file.readline
          max_temp_index = opened_file.readline.split(',').find_index('Min TemperatureC')
          lines = opened_file.readlines
          lines.each do |line|
            next if line.split(',')[max_temp_index].nil?

            if line.split(',')[max_temp_index].to_i < min_temperature
              min_temperature = line.split(',')[max_temp_index].to_i
              date = line.split(',')[0]
            end
          end
        end
      end
      "Lowest : #{min_temperature}C on #{Date.parse(date).strftime('%B %a')}"
    end

    def self.year_most_humid_day(file_name, year, max_humidity = 20, date = '2000-01-01')
      files = Dir["#{file_name}/**"]
      year_weather_files = files.map { |file| file if file.include? "#{file_name}_#{year}" }.compact!
      year_weather_files.each do |file|
        File.open(file, 'r') do |opened_file|
          opened_file.readline
          max_temp_index = opened_file.readline.split(',').find_index('Max Humidity')
          lines = opened_file.readlines
          lines.each do |line|
            next if line.split(',')[max_temp_index].nil?

            if line.split(',')[max_temp_index].to_i > max_humidity
              max_humidity = line.split(',')[max_temp_index].to_i
              date = line.split(',')[0]
            end
          end
        end
      end
      "Humid : #{max_humidity}% on #{Date.parse(date).strftime('%B %a')}"
    end
  end
end
