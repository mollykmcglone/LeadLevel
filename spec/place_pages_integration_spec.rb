require('spec_helper')

describe('the places route', :type => :feature) do
  it "allows the user to search for a place by name" do
    test_place = Place.create({:name => "EPICODUS", :address_line1 => "400 SW 6th AVENUE", :city => 'PORTLAND', :state => 'OREGON'})
    visit '/'
    fill_in 'name', :with => 'Epicodus'
    click_button 'Find this Place'
    expect(page).to have_content('EPICODUS')
  end

  it "allows the user to search for a place by address" do
    test_place = Place.create({:name => "CIBO", :address_line1 => "3444 SE DIVISION STREET", :city => 'PORTLAND', :state => 'OREGON'})
    visit '/'
    fill_in 'street_number', :with => '3444'
    select 'SE', :from => 'street_direction'
    fill_in 'street_name', :with => 'Division'
    select 'Street', :from => 'street_type'
    click_button 'Find this Address'
    expect(page).to have_content('Cibo')
  end
end
