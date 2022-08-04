module MonthHighestTemperatueChart
  module MonthHighestTemperatureChartHelper
    def month_analysis_chart_helper(lines, max_temp_index = nil, min_temp_index = nil)
      lines.each_with_index do |line, i|
        next if line.split(',')[max_temp_index].nil? || line.split(',')[min_temp_index].nil?

        max_temp = line.split(',')[max_temp_index].to_i
        print_highest_chart(max_temp, i)
        min_temp = line.split(',')[min_temp_index].to_i
        print_lowest_chart(min_temp, i)
      end
    end

    def print_highest_chart(max_temp, index = nil)
      return if max_temp.zero?

      print "#{index} "
      max_temp.times { print '+'.red }
      print " #{max_temp} \n"
    end

    def print_lowest_chart(min_temp, index = nil)
      return if min_temp.zero?

      print "#{index + 1} "
      min_temp.times { print '+'.blue }
      print " #{min_temp + 1} C \n"
    end
  end

  class MonthHighestTemperatueChartClass
    extend MonthHighestTemperatureChartHelper
    def month_analysis_chart(file_name)
      File.open(file_name, 'r') do |opened_file|
        files_data = opened_file.readlines
        files_data.delete("\r\n")
        max_temp_index = files_data[0].split(',').find_index('Max TemperatureC')
        min_temp_index = files_data[0].split(',').find_index('Min TemperatureC')
        files = files_data[1, files_data.length - 1]
        MonthHighestTemperatueChartClass.month_analysis_chart_helper(files, max_temp_index, min_temp_index)
      end
    end
  end
end
