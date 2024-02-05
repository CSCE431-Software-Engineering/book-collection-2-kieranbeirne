require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'with valid attributes' do
    it 'is valid with a title, author, published_date, and price' do
      book = Book.new(title: 'Sample Title', author: "test", price: 12.05, published_date: "2022-02-15")
      expect(book).to be_valid
    end
  end

  context 'with invalid attributes' do
    it 'is invalid without a title' do
      book = Book.new()
      expect(book).not_to be_valid
      expect(book.errors[:title]).to include("can't be blank")
    end
  end

  it 'is invalid without an author' do
    book = Book.new(title: 'Sample Title', author: nil)
    expect(book).not_to be_valid
    expect(book.errors[:author]).to include("can't be blank")
  end

  it 'is invalid without a price' do
    book = Book.new(title: 'Sample Title', price: nil)
    expect(book).not_to be_valid
    expect(book.errors[:price]).to include("can't be blank")
  end

  it 'is invalid without a published date' do
    book = Book.new(title: 'Sample Title', published_date: nil)
    expect(book).not_to be_valid
    expect(book.errors[:published_date]).to include("can't be blank")
  end
end
