require('spec_helper')

describe('the places route', :type => :feature) do
  it "allows the user to search for a place" do
    visit '/'
    fill_in 'address', :with => '3936 SE Sherman Street'
    click_link 'Begin'
    expect(page).to have_content('3936 SE Sherman Street')
  end
end
