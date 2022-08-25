require_relative 'input'

user_input = UserInputModule::UserInput.new
if ARGV.size.zero?
  mode, year, file_path = user_input.main_menu
else
  mode, year, file_path = ARGV
end
user_input.weather_man_implementaion(mode, year, file_path)
