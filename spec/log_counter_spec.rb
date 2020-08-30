# frozen_string_literal: true

require 'log_counter'

RSpec.describe LogCounter do
  let(:filepath) { './spec/support/example.log' }

  it 'Aggregates logs and counts total page visits' do
    subject.aggregate_total_page_visits(filepath)

    expect(subject.total_page_visits['/example_page/1']).to eq(5)
    expect(subject.total_page_visits['/example_page/2']).to eq(2)
    expect(subject.total_page_visits['/example_page/3']).to eq(3)
  end

  it 'Aggregates logs and counts total unique page visits' do
    subject.aggregate_total_unique_page_visits(filepath)

    expect(subject.total_unique_page_visits['/example_page/1']).to eq(3)
    expect(subject.total_unique_page_visits['/example_page/2']).to eq(2)
    expect(subject.total_unique_page_visits['/example_page/3']).to eq(1)
  end
end
