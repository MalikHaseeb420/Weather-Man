module MonthHighestTemperatueChart
  class MonthHighestTemperatueChartClass
    def self.month_analysis_chart(file_name)
      File.open(file_name, 'r') do |opened_file|
        opened_file.readline
        subject_line = opened_file.readline
        max_temp_index = subject_line.split(',').find_index('Max TemperatureC')
        min_temp_index = subject_line.split(',').find_index('Min TemperatureC')
        month_analysis_chart_helper(opened_file.readlines, max_temp_index, min_temp_index)
      end
    end

    def self.month_analysis_chart_helper(lines, max_temp_index, min_temp_index)
      lines.each_with_index do |line, i|
        max_temp = line.split(',')[max_temp_index].to_i
        min_temp = line.split(',')[min_temp_index].to_i
        print "#{i} "
        print_highest_chart(max_temp)
        print "#{i} "
        print_lowest_chart(min_temp)
      end
    end

    def self.print_highest_chart(max_temp)
      max_temp.times { print '+'.red }
      print " #{max_temp} \n"
    end

    def self.print_lowest_chart(min_temp)
      min_temp.times { print '+'.blue }
      print " #{min_temp} C \n"
    end
  end
end
