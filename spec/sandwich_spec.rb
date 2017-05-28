Sandwich = Struct.new(:taste, :toppings)

RSpec.describe 'An ideal sandwich' do
  let(:sandwich){
    Sandwich.new('delicious', [])
  }
  it 'is delicious' do
    expect(sandwich.taste).to eq('delicious')
  end
  it 'lets me add toppings' do
    sandwich.toppings << 'cheese'
    expect(sandwich.toppings).not_to be_empty
  end
end



# Form of Ruby
# Sandwich = Struct.new(:taste, :toppings)
#
# RSpec.describe 'An ideal sandwich' do
#   def sandwich
#     @sandwich ||= Sandwich.new('delicious', [])
#   end
#
#   it 'is delicious' do
#     taste = sandwich.taste
#
#     expect(taste).to eq('delicious')
#   end
#
#   it 'lets me add toppings' do
#     sandwich.toppings << 'cheese'
#     toppings = sandwich.toppings
#
#     expect(toppings).not_to be_empty
#   end
# end
