# frozen_string_literal: true

# LogCounter responsible for aggregating logs and counting visits.
class LogCounter
  def initialize
    @total_page_visits = Hash.new(0)
  end

  attr_reader :total_page_visits

  def aggregate_total_page_visits(filepath)
    File.open(filepath) do |file|
      file.readlines.each do |line|
        page_name = line.split(' ')[0]
        total_page_visits[page_name] += 1
      end
    end
  end
end
