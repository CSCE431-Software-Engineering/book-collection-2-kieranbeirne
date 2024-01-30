require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'New Book Title'
    fill_in 'Author', with: 'Author Name'
    fill_in 'Price', with: '19.99'
    select '2024', from: 'book_published_date_1i' 
    select 'January', from: 'book_published_date_2i'
    select '30', from: 'book_published_date_3i'
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created.')
    expect(Book.last.title).to eq('New Book Title')
    expect(Book.last.author).to eq('Author Name')
    expect(Book.last.price).to eq(19.99)
    expect(Book.last.published_date).to eq(Date.new(2024, 1, 30))
  end
end

RSpec.describe 'Creating a book with new attributes', type: :feature do
  scenario 'missing author' do
    visit new_book_path
    fill_in 'Title', with: 'New Book Title'
    fill_in 'Price', with: '19.99'
    select '2024', from: 'book_published_date_1i'
    select 'January', from: 'book_published_date_2i'
    select '30', from: 'book_published_date_3i'
    click_on 'Create Book'
    expect(page).to have_content("Author can't be blank")
  end

  scenario 'missing price' do
    visit new_book_path
    fill_in 'Title', with: 'New Book Title'
    fill_in 'Author', with: 'Author Name'
    select '2024', from: 'book_published_date_1i'
    select 'January', from: 'book_published_date_2i'
    select '30', from: 'book_published_date_3i'
    click_on 'Create Book'
    expect(page).to have_content("Price can't be blank")
  end

  scenario 'missing published date' do
    visit new_book_path
    fill_in 'Title', with: 'New Book Title'
    fill_in 'Author', with: 'Author Name'
    fill_in 'Price', with: '19.99'
    click_on 'Create Book'
    expect(page).to have_content("Published date can't be blank")
  end
end
