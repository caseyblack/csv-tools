require 'csv'
require 'fileutils'

Dir['*.csv'].each do |file_name|
  
  temp_file_name = "/Users/name/Desktop/files/new-#{file_name}"
  new_csv = CSV.open(temp_file_name, "wb")
  old_file = File.read(file_name).gsub(/\\"/,'""')
  old_file_name = File.basename("/Users/name/Desktop/files/#{file_name}", ".csv")
  index = 0
  
  CSV.parse(old_file) do |row|
    string_to_append = ''
    if index == 0
      string_to_append = 'filename'
    else
      string_to_append = old_file_name
    end
    index += 1
    row << string_to_append
    new_csv << row
  end
  FileUtils.mv("#{temp_file_name}", "/Users/name/files/new_files/#{old_file_name}.csv")
end