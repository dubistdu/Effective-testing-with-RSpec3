class Coffee
  def ingredients
    @ingredients ||=[]
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def price
    1.00
  end
end

# need the following lines to use with '--only-failures' flag
# '--only-failures' flag  -> when you have more than one failure
# rspec filename.rb --only-failures


RSpec.configure do |config|
  config.example_status_persistence_file_path = 'spec/examples.txt'
end

RSpec.describe 'A cup of coffee' do
  let(:coffee) { Coffee.new }

  it 'costs $1' do
    expect(coffee.price).to eq(1.00)
  end

  context 'with milk' do
    before { coffee.add :milk}

    it 'costs $1.25' do
      expect(coffee.price).to eq(1.25)
    end
  end
end
