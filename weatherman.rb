require_relative 'mode1'
require_relative 'mode2'
require_relative 'mode3'

if ARGV.size.zero? || ARGV.size < 3
  puts 'Please pass arguments to the files'.red
else
  mode, year, file_path = ARGV
  if File.directory? file_path
    case mode
    when '-e'
      year_temp_obj = YearHighestTemperatue::YearHighestTemperatueClass.new
      puts year_temp_obj.year_highest_temp_day(file_path, year)
      puts year_temp_obj.year_lowest_temp_day(file_path, year)
      puts year_temp_obj.year_most_humid_day(file_path, year)
    when '-a'
      month_temp_obj = MonthHighestTemperatue::MonthHighestTemperatueClass.new
      month_name = Date.parse("#{year.split('/')[0]}-#{year.split('/')[1]}-01").strftime('%b')
      file_path = "#{file_path}/#{file_path}_#{year.split('/')[0]}_#{month_name}.txt"
      puts month_temp_obj.month_highest_temp_day(file_path)
      puts month_temp_obj.month_lowest_temp_day(file_path)
      puts month_temp_obj.month_most_humid_day(file_path)
    when '-c'
      month_name = Date.parse("#{year.split('/')[0]}-#{year.split('/')[1]}-01").strftime('%b')
      file_path = "#{file_path}/#{file_path}_#{year.split('/')[0]}_#{month_name}.txt"
      month_chart_obj = MonthHighestTemperatueChart::MonthHighestTemperatueChartClass.new
      month_chart_obj.month_analysis_chart(file_path)
    end
  else
    puts 'Please provide a right directory path'.red
  end
end
