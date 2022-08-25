require 'date'
require 'colortheme'

module MonthHighestTemperatue
  module HelperModule
    def month_highest_temp_day_helper(lines, max_temp_index)
      lines.inject(0) do |sum, line|
        sum + line.split(',')[max_temp_index].to_i
      end
    end

    def month_lowest_temp_day_helper(lines, max_temp_index)
      lines.inject(0) do |sum, line|
        sum + line.split(',')[max_temp_index].to_i
      end
    end

    def month_most_humid_day_helper(lines, max_temp_index)
      lines.inject(0) do |sum, line|
        sum + line.split(',')[max_temp_index].to_i
      end
    end
  end

  class MonthHighestTemperatueClass
    extend HelperModule
    def month_highest_temp_day(file_name)
      sum = 0
      File.open(file_name, 'r') do |opened_file|
        files_data = opened_file.readlines
        files_data.delete("\r\n")
        max_temp_index = files_data[0].split(',').find_index('Max TemperatureC')
        lines = files_data[1, files_data.length - 1]
        sum = MonthHighestTemperatueClass.month_highest_temp_day_helper(lines, max_temp_index) / lines.length
        "Average Highest : #{sum} C"
      end
    end

    def month_lowest_temp_day(file_name)
      sum = 0
      File.open(file_name, 'r') do |opened_file|
        files_data = opened_file.readlines
        files_data.delete("\r\n")
        max_temp_index = files_data[0].split(',').find_index('Min TemperatureC')
        lines = files_data[1, files_data.length - 1]
        sum = MonthHighestTemperatueClass.month_lowest_temp_day_helper(lines, max_temp_index) / lines.length
        "Average Lowest : #{sum} C"
      end
    end

    def month_most_humid_day(file_name)
      sum = 0
      File.open(file_name, 'r') do |opened_file|
        files_data = opened_file.readlines
        files_data.delete("\r\n")
        max_temp_index = files_data[0].split(',').find_index('Max Humidity')
        lines = files_data[1, files_data.length - 1]
        sum = MonthHighestTemperatueClass.month_most_humid_day_helper(lines, max_temp_index) / lines.length
        "Average Humidity : #{sum} %"
      end
    end
  end
end
