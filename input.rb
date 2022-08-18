require_relative 'mode1'
require_relative 'mode2'
require_relative 'mode3'

module UserInputModule
  class UserInput
    def main_menu
      puts "\n\n\t*********Welcome to Weather*********".green
      puts "\nTo get weather details please provide following details\n".red
      mode = user_mode_input
      year = year_input(mode)
      file_path = user_file_path
      [mode, year, file_path]
    end

    def user_mode_input
      monde_input_menu
      mode = gets.chomp
      until mode =~ /^-[aec]$/
        puts
        puts 'Error please select right choice again'.red
        monde_input_menu
        mode = gets.chomp
      end
      mode
    end

    def user_file_path
      print 'Enter files directory path : '
      file_input = gets.chomp
      until File.directory? file_input
        puts 'file path not exist Enter right path'.red
        print 'Enter files directory path : '
        file_input = gets_chomp
      end
      file_input
    end

    def year_input(mode)
      year = ''
      case mode
      when '-e'
        print 'Enter Year : '
        year = gets.chomp
        until year =~ /^\d{4}$/
          puts 'please enter valid year '.red
          year = gets.chomp
        end
      when /^-[a,c]$/
        year = year_input_helper_ac
      end
      year
    end

    def year_input_helper_ac
      print 'Enter Year then month sepreated with "/" : '
      year = gets.chomp
      until year =~ %r/^\d{4}\/\d{1,2}$/
        puts 'please enter valid year and month seperated with "\"'.red
        year = gets.chomp
      end
    end

    def monde_input_menu
      puts 'Please Select your mode'.red
      puts 'Select Mode "e" for year highest temp, humidity and lowest temp'.green
      puts 'Select Mode "a" for specific month\'s average max temp, max humidity and min temp'.green
      puts 'Select Mode "c" to specific month\'s bar chart of max temp and min temp'.green
      print 'Please Enter your choice : '
    end

    def weather_man_implementaion(mode = nil, year = nil, file_path = nil)
      case mode
      when '-e'
        weather_man_implementaion_for_e(file_path, year)
      when '-a'
        weather_man_implementaion_for_a(file_path, year)
      when '-c'
        weather_man_implementaion_for_c(file_path, year)
      end
    end

    def weather_man_implementaion_for_e(file_path = nil, year = nil)
      year_temp_obj = YearHighestTemperatue::YearHighestTemperatueClass.new
      puts year_temp_obj.year_highest_temp_day(file_path, year)
      puts year_temp_obj.year_lowest_temp_day(file_path, year)
      puts year_temp_obj.year_most_humid_day(file_path, year)
    end

    def weather_man_implementaion_for_a(file_path = nil, year = nil)
      year_month = year.split('/')
      month_temp_obj = MonthHighestTemperatue::MonthHighestTemperatueClass.new
      month_name = Date.parse("#{year_month[0]}-#{year_month[1]}-01").strftime('%b')
      file_path = "#{file_path}/#{file_path}_#{year_month[0]}_#{month_name}.txt"
      if File.exist? file_path
        puts month_temp_obj.month_highest_temp_day(file_path)
        puts month_temp_obj.month_lowest_temp_day(file_path)
        puts month_temp_obj.month_most_humid_day(file_path)
      else
        puts "file not exist path #{file_path}".red
      end
    end

    def weather_man_implementaion_for_c(file_path = nil, year = nil)
      year_month = year.split('/')
      month_temp_obj = MonthHighestTemperatue::MonthHighestTemperatueClass.new
      month_name = Date.parse("#{year_month[0]}-#{year_month[1]}-01").strftime('%b')
      file_path = "#{file_path}/#{file_path}_#{year_month[0]}_#{month_name}.txt"
      if File.exist? file_path
        puts month_temp_obj.month_highest_temp_day(file_path)
        puts month_temp_obj.month_lowest_temp_day(file_path)
        puts month_temp_obj.month_most_humid_day(file_path)
      else
        puts "file not exist path #{file_path}".red
      end
    end
  end
end
