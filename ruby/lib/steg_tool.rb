require 'optparse'
require_relative 'steg_tools/steg_automate'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: stegautomate.rb [options]"

  opts.on("-f FILE", "--file=FILE", "File to analyse") do |f|
    options[:file] = f
  end

  opts.on("-t TEXT", "--text=TEXT", "Flag starting pattern ( e.g: 'picoCTF{' )") do |t|
    options[:text_to_search] = t
  end

  opts.on("-p PATTERN", "--pattern=PATTERN", "Char that delimit the end of the flag") do |p|
    options[:pattern] = p
  end

  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end
end.parse!

def process_strings_analysis(options)
  StegTools::StegAutomate.new(options).run
end

def ask_options(options)
  if options[:file].nil?
    print "What is the file to analyse path ? (/path/to/file) : "
    options[:file] = gets.chomp
  end

  if options[:text_to_search].nil?
    print "What is the flag starting pattern ? ( default: 'picoCTF{' ) : "
    answer = gets.chomp
    options[:text_to_search] = answer.empty? ? 'picoCTF{' : answer
  end

  if options[:pattern].nil?
    print "What is the char that delimit the end of the flag ? ( default: '}' ) : "
    answer = gets.chomp
    options[:pattern] = answer.empty? ? '}' : answer
  end
end

puts "**************************************************************************"
puts "**************************************************************************"
puts "**     ####    #####  ######   ####    #####   ####    ####   #         **
**   #          #    #       #    #     #    #    #  #    #  #          **
**    ####      #    #####   #          #    #    #  #    #  #          **
**        #     #    #       #  ###     #    #    #  #    #  #          **
**   #    #     #    #       #    #     #    #    #  #    #  #          **
**    ####      #    ######   ####      #     ####    ####   ######     **"
puts "**                                                                      **"
puts "**                Welcome to my custom stegano tool                     **"
puts "**************************************************************************"
puts "**************************************************************************"
puts "Made by: fulanypwn3r                               "
puts "Date: 23/11/2023                                   "
puts "\n"
puts "\n"
puts "Here are our disponible tools:                     "
puts "\t1. String Analysis                               "
puts "\n"
puts "\n"
print "Do you want to perform a strings analysis? (y/n) : "
answer = gets.chomp.downcase

if answer == 'y'
  ask_options(options)
  puts "[+] Processing..."
  process_strings_analysis(options)
else
  puts "Exiting."
end