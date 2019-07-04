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

RSpec.shared_examples 'index example' do |size = 5|
  it "returns #{size} resource" do
    subject
    expect_json_sizes(resources: size)
  end
end

RSpec.shared_examples 'validate resource types' do |data_types|
  it 'is valid' do
    subject
    expect_json_types('resource', *data_types)
  end
end

RSpec.shared_examples 'bulk update' do |updated_parameters|
  it 'updates successfully' do
    subject
    expect(json_body[:resource].slice(*updated_parameters)).to eq(model_params.slice(*updated_parameters))
  end
end
