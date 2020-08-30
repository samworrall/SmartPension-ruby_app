# frozen_string_literal: true

require 'parser'

RSpec.describe Parser do
  let(:subject) { described_class }
  let(:filepath) { './spec/support/example.log' }

  it 'outputs parsed and formatted logs' do
    expect { subject.call(filepath) }.to output(
      <<~HEREDOC
        printing pages by magnitude of visits
        =========================================
        /example_page/1 5 visits
        /example_page/3 3 visits
        /example_page/2 2 visits
        =========================================
        finished!
        printing pages by magnitude of unique views
        =========================================
        /example_page/1 3 unique views
        /example_page/2 2 unique views
        /example_page/3 1 unique views
        =========================================
        finished!
      HEREDOC
    ).to_stdout
  end
end
