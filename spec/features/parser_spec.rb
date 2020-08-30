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

  context 'when no file is given' do
    it 'returns a custom message' do
      expect { subject.call(nil) }.to output(
        'a valid filepath is required as an argument to this script'
      ).to_stdout
    end
  end

  context 'when a non existent file is given' do
    it 'returns a custom message' do
      expect { subject.call('./non_existent_file.log') }.to output(
        'that file does not exist'
      ).to_stdout
    end
  end

  context 'when an empty file is given' do
    it 'returns a custom message' do
      expect { subject.call('./empty_file.log') }.to output(
        'that file is empty'
      ).to_stdout
    end
  end
end
