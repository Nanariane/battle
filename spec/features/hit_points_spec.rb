feature 'View hit points' do
  scenario 'see pLayer 2 hit points' do
    visit('/')
    fill_in :player_1_name, with: 'Dave'
    fill_in :player_2_name, with: 'Julie'
    click_button 'Submit'
    expect(page).to have_content 'Julie: 60HP'
  end
end
