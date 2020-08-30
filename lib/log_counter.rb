# frozen_string_literal: true

# LogCounter responsible for aggregating logs and counting visits.
class LogCounter
  def initialize
    @unique_logs = []
    @total_page_visits = Hash.new(0)
    @total_unique_page_visits = Hash.new(0)
  end

  attr_reader :total_page_visits, :total_unique_page_visits, :unique_logs
  private :unique_logs

  def aggregate_logs(filepath)
    File.open(filepath) do |file|
      file.readlines.each do |line|
        aggregate_total_page_visits(line)
        aggregate_total_unique_page_visits(line)
      end
    end
  end

  private

  def aggregate_total_page_visits(line)
    page_name = line.split(' ')[0]
    total_page_visits[page_name] += 1
  end

  def aggregate_total_unique_page_visits(line)
    return if unique_logs.include?(line.split(' '))

    log = line.split(' ')
    page_name = log[0]
    total_unique_page_visits[page_name] += 1
    unique_logs << log
  end
end
