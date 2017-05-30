class Coffee
  def ingredients
    @ingredients ||=[]
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def price
    1.00 + ingredients.size*0.25
  end
end

# need the following lines to use with '--only-failures' flag
# '--only-failures' flag  -> when you have more than one failure
# rspec filename.rb --only-failures

# config.filter_run_when_matching(focus:true)   rspec to focus only on slected examples

RSpec.configure do |config|
  config.filter_run_when_matching(focus:true)
  config.example_status_persistence_file_path = 'spec/examples.txt'
end

RSpec.describe 'A cup of coffee' do
  let(:coffee) { Coffee.new }

  it 'costs $1' do
    expect(coffee.price).to eq(1.00)
  end

# add 'f' in front of context to make rspec focus on this particular example
# fcontext'with milk' do     same as     config.filter_run_when_matching(focus:true)
# use pending method when you are sure of future examples
  context 'with milk' do
    before { coffee.add :milk}

    it 'costs $1.25' do
      expect(coffee.price).to eq(1.25)
    end
    it 'is light in color' do
      pending 'Color not implemented yet'
      expect(coffee.color).to be(:light)
    end
    it 'is cooler than 200F' do
      pending 'Tempertature not implemented yet'
      expect(coffee.temperature).to be<200.0
    end
  end
end
