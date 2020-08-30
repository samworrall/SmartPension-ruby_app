# frozen_string_literal: true

require 'log_counter'

RSpec.describe LogCounter do
  let(:filepath) { './spec/support/example.log' }

  it 'Aggregates logs' do
    subject.aggregate_total_page_visits(filepath)

    expect(subject.total_page_visits['/example_page/1']).to eq(5)
  end
end
