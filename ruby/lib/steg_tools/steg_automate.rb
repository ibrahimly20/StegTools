require_relative 'steg_tools'

class StegTools::StegAutomate
  attr_accessor :search_strings, :options
  attr_reader :strings_result

  def initialize(options)
    @options = options
  end

  def search_strings
    @strings_result = %x{ strings #{@options[:file]} }
  end

  def file_contain_string?
    @strings_result.include?(@options[:text_to_search])
  end

  def index_of_pattern
    @strings_result.index(@options[:text_to_search])
  end

  def index_of_delimetter(start)
    new_string = @strings_result[start..-1]
    return new_string.index(@options[:pattern]) + start
  end

  def search_for_specific_string
    start = index_of_pattern
    if file_contain_string?
      return @strings_result[start..index_of_delimetter(start)]
    end
  end

  def run
    search_strings
    result = search_for_specific_string
    puts "[x] flag not found !!!" if result.nil?
    puts "[+] the flag is : #{result}" unless result.nil?
  end
end