# frozen_string_literal: true

require_relative './log_counter'
require_relative './log_orderer'
require_relative './printer'

# Parser responsible for taking a log file and outputting parsed contents.
class Parser
  def self.call(filepath)
    return print 'a valid filepath is required as an argument to this script' if filepath.nil?
    return print 'that file does not exist' unless File.exist?(filepath)
    return print 'that file is empty' if File.zero?(filepath)

    log_counter = LogCounter.new
    printer = Printer.new

    log_counter.aggregate_logs(filepath)
    total_page_visits = log_counter.total_page_visits
    total_unique_page_visits = log_counter.total_unique_page_visits
    ordered_total_visits = LogOrderer.call(total_page_visits)
    ordered_unique_visits = LogOrderer.call(total_unique_page_visits)

    printer.print(ordered_total_visits)
    printer.print(ordered_unique_visits, unique: true)
  end
end

Parser.call(ARGV[0])
