require('spec_helper')

describe('the places route', :type => :feature) do

  it "allows the user to search for a place by address" do
    test_place = Place.create({:name => nil, :address_line1 => "3936 SE SHERMAN STREET", :city => 'PORTLAND', :state => 'OREGON', contact_id: '4', user_id: '5', rating: 'red'})
    binding.pry
    visit '/'
    fill_in 'street_number', :with => '3936'
    select('SE', :from => 'street_direction')
    fill_in 'street_name', :with => 'SHERMAN'
    select('Street', :from => 'street_type')
    click_button('Find by Address')
    expect(page).to have_content('We found x places...')
  end

  it "allows the user to search for a place by name" do
    test_place = Place.create({:name => "EPICODUS", :address_line1 => "400 SW 6th AVENUE", :city => 'PORTLAND', :state => 'OREGON'})
    visit '/'
    fill_in 'name', :with => 'Epicodus'
    click_button('Find by Name')
    expect(page).to have_content('EPICODUS')
  end
end
