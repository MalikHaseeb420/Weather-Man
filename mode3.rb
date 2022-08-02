module MonthHighestTemperatueChart
  class MonthHighestTemperatueChartClass
    def self.month_analysis_chart(file_name)
      File.open(file_name, 'r') do |opened_file|
        files_data = opened_file.readlines
        files_data.delete("\r\n")
        max_temp_index = files_data[0].split(',').find_index('Max TemperatureC')
        min_temp_index = files_data[0].split(',').find_index('Min TemperatureC')
        month_analysis_chart_helper(files_data[1, files_data.length - 1], max_temp_index, min_temp_index)
      end
    end

    def self.month_analysis_chart_helper(lines, max_temp_index, min_temp_index)
      lines.each_with_index do |line, i|
        next if line.split(',')[max_temp_index].nil?

        max_temp = line.split(',')[max_temp_index].to_i
        print_highest_chart(max_temp, i)
        next if  line.split(',')[min_temp_index].nil?

        min_temp = line.split(',')[min_temp_index].to_i
        print_lowest_chart(min_temp, i)
      end
    end

    def self.print_highest_chart(max_temp, index)
      return if max_temp.zero?

      print "#{index} "
      max_temp.times { print '+'.red }
      print " #{max_temp} \n"
    end

    def self.print_lowest_chart(min_temp, index)
      return if min_temp.zero?

      print "#{index + 1} "
      min_temp.times { print '+'.blue }
      print " #{min_temp + 1} C \n"
    end
  end
end
