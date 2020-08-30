# frozen_string_literal: true

require 'log_orderer'

RSpec.describe LogOrderer do
  let(:subject) { described_class }
  let(:log_counts) do
    {
      '/example_page/2' => 2,
      '/example_page/1' => 5,
      '/example_page/3' => 3
    }
  end

  it 'returns an ordered list by magnitude' do
    expect(subject.call(log_counts)).to eq(
      [
        ['/example_page/1', 5],
        ['/example_page/3', 3],
        ['/example_page/2', 2]
      ]
    )
  end
end
