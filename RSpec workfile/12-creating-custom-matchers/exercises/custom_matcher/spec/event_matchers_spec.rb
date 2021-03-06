#---
# Excerpted from "Effective Testing with RSpec 3",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/rspec3 for more book information.
#---
Event = Struct.new(:name, :capacity) do
  def purchase_ticket_for(guest)
    tickets_sold << guest
  end

  def tickets_sold
    @tickets_sold ||= []
  end

  def inspect
    "#<Event #{name.inspect} (capacity: #{capacity})>"
  end
end

RSpec.describe '`have_no_tickets_sold` matcher' do
  example 'passing expectation' do
    art_show = Event.new('Art Show', 100)

    expect(art_show).to have_no_tickets_sold
  end

  example 'failing expectation' do
    art_show = Event.new('Art Show', 100)
    art_show.purchase_ticket_for(:a_friend)

    expect(art_show).to have_no_tickets_sold
  end
end

RSpec.describe '`be_sold_out` matcher' do
  example 'passing expectation' do
    u2_concert = Event.new('U2 Concert', 10_000)
    10_000.times { u2_concert.purchase_ticket_for(:a_fan) }

    expect(u2_concert).to be_sold_out
  end

  example 'failing expectation' do
    u2_concert = Event.new('U2 Concert', 10_000)
    9_900.times { u2_concert.purchase_ticket_for(:a_fan) }

    expect(u2_concert).to be_sold_out
  end
end
