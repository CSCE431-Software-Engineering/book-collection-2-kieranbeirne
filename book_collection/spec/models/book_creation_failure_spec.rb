require 'rails_helper'

RSpec.describe 'Creating a book with invalid inputs', type: :feature do
  scenario 'missing title' do
    visit new_book_path
    click_on 'Create Book'
    expect(page).to have_content('')
  end
end
