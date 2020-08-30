# frozen_string_literal: true

require 'printer'

RSpec.describe Printer do
  let(:ordered_log_counts) do
    [
      ['/example_page/1', 5],
      ['/example_page/3', 3],
      ['/example_page/2', 2]
    ]
  end

  it 'pretty prints the ordered log counts' do
    expect { subject.print(ordered_log_counts) }.to output(
      <<~HEREDOC
        printing pages by magnitude of visits
        =========================================
        /example_page/1 5 visits
        /example_page/3 3 visits
        /example_page/2 2 visits
        =========================================
        finished!
      HEREDOC
    ).to_stdout
  end

  context 'when unique log counts are specified' do
    it 'pretty prints the unique ordered logs variation' do
      expect { subject.print(ordered_log_counts, unique: true) }.to output(
        <<~HEREDOC
          printing pages by magnitude of unique views
          =========================================
          /example_page/1 5 unique views
          /example_page/3 3 unique views
          /example_page/2 2 unique views
          =========================================
          finished!
        HEREDOC
      ).to_stdout
    end
  end
end
