RSpec.describe 'An ideal sandwich' do
  it 'is delicious' do
    snadwich = Sandwich.new('delicious',[])
    expect(sandwich.taste).to eq('delicious')
  end
end
