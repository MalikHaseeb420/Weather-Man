require 'date'
require 'colortheme'

module MonthHighestTemperatue
  class MonthHighestTemperatueClass
    def self.month_highest_temp_day(file_name)
      sum = 0
      File.open(file_name, 'r') do |opened_file|
        opened_file.readline
        max_temp_index = opened_file.readline.split(',').find_index('Max TemperatureC')
        lines = opened_file.readlines
        lines.each do |line|
          sum += line.split(',')[max_temp_index].to_i
        end
        sum /= lines.length
      end
      "Average Highest : #{sum}C"
    end

    def self.month_lowest_temp_day(file_name)
      sum = 0
      File.open(file_name, 'r') do |opened_file|
        opened_file.readline
        max_temp_index = opened_file.readline.split(',').find_index('Min TemperatureC')
        lines = opened_file.readlines
        lines.each do |line|
          sum += line.split(',')[max_temp_index].to_i
        end
        sum /= lines.length
      end
      "Average Highest : #{sum}C"
    end

    def self.month_most_humid_day(file_name)
      sum = 0
      File.open(file_name, 'r') do |opened_file|
        opened_file.readline
        max_temp_index = opened_file.readline.split(',').find_index('Max Humidity')
        lines = opened_file.readlines
        lines.each do |line|
          sum += line.split(',')[max_temp_index].to_i
        end
        sum /= lines.length
      end
      "Average Highest : #{sum}%"
    end
  end
end
