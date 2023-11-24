require 'safe_shell'
require_relative 'steg_tools'

CMD = ['strings', 'exiftool']

class StegTools::StegAutomate
  attr_accessor :options
  attr_reader :strings_result, :flag

  def initialize(options)
    @options = options
  end

  def search_strings(command)
    @strings_result = SafeShell.execute(command, @options[:file])
    unless $?.success?
      raise SafeShell::CommandFailedException.new("Shell command #{[command, @options[:file]].inspect} failed with status #{$?}")
    end
  rescue => err
    case err
    when Errno::ENOENT then puts "Error: File not found."
    when SafeShell::CommandFailedException then puts err.message
    else puts "Error: Something gone wrong."
    end
    exit
  end

  def file_contain_string?
    @strings_result.include?(@options[:text_to_search])
  end

  def index_of_pattern
    @strings_result.index(@options[:text_to_search])
  end

  def index_of_delimetter(start)
    return @strings_result.index(@options[:pattern], start)
  end

  def search_for_specific_string
    start = index_of_pattern
    if file_contain_string?
      @flag = @strings_result[start..index_of_delimetter(start)]
    end
  end

  def search(command)
    search_strings(command)
    yield if block_given?
    search_for_specific_string
    render_response unless @flag.nil?
  end

  def run
    CMD.each do |cmd|
      search(cmd)
    end
    puts "[x] flag not found !!!" if @flag.nil?
    exit
  end

  def render_response
    puts "[+] the flag is : #{@flag}"
    exit
  end
end