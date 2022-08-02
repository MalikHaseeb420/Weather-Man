require 'date'
require 'colortheme'
module YearHighestTemperatue
  class YearHighestTemperatueClass
    def self.year_highest_temp_day(file_name, year)
      files = Dir["#{file_name}/**"]
      year_weather_files = files.map { |file| file if file.include? "#{file_name}_#{year}" }.compact!
      year_highest_temp_day_helper(year_weather_files)
    end

    def self.year_highest_temp_day_helper(year_weather_files)
      data = {
        date: '2000-01-21',
        temperature: 0
      }
      year_weather_files.each do |file|
        File.open(file, 'r') do |opened_file|
          files_data = opened_file.readlines
          files_data.delete("\r\n")
          max_temp_index = files_data[0].split(',').find_index('Max TemperatureC')
          lines = files_data[1, files_data.length - 1]
          data = year_highest_temp_getter(lines, data, max_temp_index)
        end
      end
      "Highest : #{data[:temperature]} C on #{Date.parse(data[:date]).strftime('%B %d')}"
    end

    def self.year_highest_temp_getter(lines, data, max_temp_index)
      lines.each do |line|
        next if line.split(',')[max_temp_index].nil?

        if line.split(',')[max_temp_index].to_i > data[:temperature].to_i
          data[:temperature] = line.split(',')[max_temp_index].to_i
          data[:date] = line.split(',')[0]
        end
      end
      data
    end

    def self.year_lowest_temp_day(file_name, year)
      files = Dir["#{file_name}/**"]
      year_weather_files = files.map { |file| file if file.include? "#{file_name}_#{year}" }.compact!
      year_lowest_temp_day_helper(year_weather_files)
    end

    def self.year_lowest_temp_day_helper(year_weather_files)
      data = {
        date: '2000-01-21',
        temperature: 0
      }
      year_weather_files.each do |file|
        File.open(file, 'r') do |opened_file|
          files_data = opened_file.readlines
          files_data.delete("\r\n")
          max_temp_index = files_data[0].split(',').find_index('Min TemperatureC')
          lines = files_data[1, files_data.length - 1]
          data = year_highest_temp_getter(lines, data, max_temp_index)
        end
      end
      "Lowest : #{data[:temperature]} C on #{Date.parse(data[:date]).strftime('%B %d')}"
    end

    def self.year_lowest_temp_getter(lines, data, max_temp_index)
      lines.each do |line|
        next if line.split(',')[max_temp_index].nil?

        if line.split(',')[max_temp_index].to_i < data[:temperature].to_i
          data[:temperature] = line.split(',')[max_temp_index].to_i
          data[:date] = line.split(',')[0]
        end
      end
      data
    end

    def self.year_most_humid_day(file_name, year)
      files = Dir["#{file_name}/**"]
      year_weather_files = files.map { |file| file if file.include? "#{file_name}_#{year}" }.compact!
      year_most_humid_day_helper(year_weather_files)
    end

    def self.year_most_humid_day_helper(year_weather_files)
      data = {
        date: '2000-01-21',
        temperature: 0
      }
      year_weather_files.each do |file|
        File.open(file, 'r') do |opened_file|
          files_data = opened_file.readlines
          files_data.delete("\r\n")
          max_temp_index = files_data[0].split(',').find_index('Max Humidity')
          lines = files_data[1, files_data.length - 1]
          data = year_highest_temp_getter(lines, data, max_temp_index)
        end
      end

      "Humid : #{data[:temperature]} % on #{Date.parse(data[:date]).strftime('%B %d')}"
    end

    def self.year_humid_temp_getter(lines, data, max_temp_index)
      lines.each do |line|
        next if line.split(',')[max_temp_index].nil?

        if line.split(',')[max_temp_index].to_i > data[:temperature].to_i
          data[:temperature] = line.split(',')[max_temp_index].to_i
          data[:date] = line.split(',')[0]
        end
      end
      data
    end
  end
end
