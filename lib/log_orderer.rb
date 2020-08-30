# frozen_string_literal: true

# LogOrderer responsible for ordering log counts by magnitude.
class LogOrderer
  def self.call(log_counts)
    log_counts.sort { |a, b| a[1] <=> b[1] }.reverse
  end
end
