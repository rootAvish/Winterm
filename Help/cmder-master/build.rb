# Samuel Vasko 2013
# Cmder build script
# Like really a beta
#
# This script downloads dependencies form google code. Each software is extracted
# in a folder with same name as the project on google code. So Conemu becomes
# conemu-maximus5. Correct files are beeing picked by using labels.
# I will move the script for getting files by labels from php to here as soon I feel like it

require 'fileutils'
require 'open-uri'
require 'uri'

def get_file project, query
    urlToFile = URI.escape('http://samuelvasko.tk/gcode/?project='+project+'&query='+query)
    open(urlToFile) do |resp|
        urlToFile = URI.escape(resp.read.split(/\r?\n/).first)
    end

    extension = urlToFile.split('.').last
    filename = project+'.'+extension

    puts "\n ------ Downloading #{project} from #{urlToFile} ------- \n \n"
    begin
        open(urlToFile, 'rb') do |infile|
            open(filename, 'wb') do |outfile|
                outfile.write(infile.read)
            end
        end
    rescue IOError => error
        puts error
        FileUtils.rm(filename) if File.exists?(filename)
        exit(1)
    end

    system("7z x -o\"#{project}\" #{filename}")

    File.unlink(project+"."+extension);

    # When the folder contains another folder
    # that is not what we want
    if Dir.glob("#{project}/*").length == 1
        temp_name = "#{project}_temp"
        FileUtils.mv(project, temp_name)
        FileUtils.mv(Dir.glob("#{temp_name}/*")[0], project)
        FileUtils.rm_r(temp_name)
    end
end

def find_on_path exe
    path = ENV['PATH'].split(File::PATH_SEPARATOR)
    for dir in path
        if File.exists?(File.join(dir, exe))
            return true
        end
    end

    return false
end

puts '
______       _ _     _ _                                   _
| ___ \     (_) |   | (_)                                 | |
| |_/ /_   _ _| | __| |_ _ __   __ _     ___ _ __ ___   __| | ___ _ __
| ___ \ | | | | |/ _` | | \'_ \ / _` |   / __| \'_ ` _ \ / _` |/ _ \ \'__|
| |_/ / |_| | | | (_| | | | | | (_| |  | (__| | | | | | (_| |  __/ |
\____/ \__,_|_|_|\__,_|_|_| |_|\__, |   \___|_| |_| |_|\__,_|\___|_|
                                __/ |
                               |___/
'

unless find_on_path('7z.exe')
    puts '7z.exe not found. Ensure 7-zip is installed and on the PATH.'
    exit(1)
end

build_exe = true
unless find_on_path('msbuild.exe')
    puts 'msbuild.exe not found. We need that to build the executable.'
    puts 'Do you want to continue? [Y/n]'
    build_exe = false
    exit(1) unless gets.chomp.downcase == 'y'
end

puts 'Cleanup'

if Dir.exists?('vendor')
    Dir.glob('vendor/*') { |file| FileUtils.rm_rf(file) if File.directory?(file) }
end

Dir.chdir('vendor')

puts 'Getting files'

get_file('clink', 'label:Type-Archive label:Featured')
get_file('conemu-maximus5', 'label:Type-Archive label:Preview label:Featured')
get_file('msysgit', 'label:Type-Archive label:Featured')

puts 'Creating executable'

if build_exe
    Dir.chdir('../launcher')
    status = system('msbuild /p:Configuration=Release')
    unless status
        puts 'Looks like the build failied'
        exit(1)
    end
end

puts 'Done, bye'
