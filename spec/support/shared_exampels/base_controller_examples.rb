# frozen_string_literal: true

RSpec.shared_examples 'success' do
  it 'is success' do
    subject
    expect(response.status).to eq(200)
  end
end

RSpec.shared_examples 'change by count' do |model, count|
  it "change #{count} object(s) of #{model}" do
    expect { subject }.to change(model, :count).by count
  end
end

RSpec.shared_examples 'validate errors' do |key, errors|
  it "error #{key}" do
    subject
    expect_json("errors.#{key}", errors)
  end
end
