# frozen_string_literal: true

require 'log_counter'
require 'log_orderer'
require 'printer'

# Parser responsible for taking a log file and outputting parsed contents.
class Parser
  def self.call(filepath)
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
