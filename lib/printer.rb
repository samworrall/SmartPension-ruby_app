# frozen_string_literal: true

# Printer responsible for pretty printing ordered logs to stdout.
class Printer
  def print(ordered_log_counts, unique: false)
    message = unique ? 'unique views' : 'visits'

    puts "printing pages by magnitude of #{message}"
    puts '========================================='

    ordered_log_counts.each do |log|
      puts("#{log.join(' ')} #{message}")
    end

    puts '========================================='
    puts 'finished!'
  end
end
