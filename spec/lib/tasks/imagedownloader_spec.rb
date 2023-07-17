require 'rspec'
require 'rake'

describe 'imagedownloader:bulk_downloads' do
  before(:all) do
    Rake.application.load_rakefile
  end

  it 'save images' do
    Rake::Task['imagedownloader:bulk_downloads'].invoke
    # need to evaluate changes
    expect(some_result).to eq(expected_result)
  end
end
