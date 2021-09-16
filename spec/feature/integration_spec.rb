# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'Harry Potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '6.99'
    fill_in 'Published-date', with: '1997-06-26'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('Harry Potter')
  end

  scenario 'invalid title' do
    visit new_book_path
    fill_in 'Title', with: ''
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '6.99'
    fill_in 'Published-date', with: '1997-06-26'
    click_on 'Create Book'
    expect(page).to have_content("Title can't be blank")
  end

  scenario 'invalid author' do
    visit new_book_path
    fill_in 'Title', with: 'Harry Potter'
    fill_in 'Author', with: ''
    fill_in 'Price', with: '6.99'
    fill_in 'Published-date', with: '1997-06-26'
    click_on 'Create Book'
    expect(page).to have_content("Author can't be blank")
  end

  scenario 'invalid price (empty)' do
    visit new_book_path
    fill_in 'Title', with: 'Harry Potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: ''
    fill_in 'Published-date', with: '1997-06-26'
    click_on 'Create Book'
    expect(page).to have_content("Price can't be blank")
  end

  scenario 'invalid price (non-numeric)' do
    visit new_book_path
    fill_in 'Title', with: 'Harry Potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: 'free'
    fill_in 'Published-date', with: '1997-06-26'
    click_on 'Create Book'
    expect(page).to have_content("Price must be a number")
  end

  scenario 'invalid date (empty)' do
    visit new_book_path
    fill_in 'Title', with: 'Harry Potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '6.99'
    fill_in 'Published-date', with: 'test'
    click_on 'Create Book'
    expect(page).to have_content("Published-date must be a valid date (DD-MM-YYYY)")
  end

  scenario 'invalid date (random text)' do
    visit new_book_path
    fill_in 'Title', with: 'Harry Potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '6.99'
    fill_in 'Published-date', with: 'test'
    click_on 'Create Book'
    expect(page).to have_content("Published-date must be a valid date (DD-MM-YYYY)")
  end

  scenario 'invalid date (MM-DD-YYYY format)' do
    visit new_book_path
    fill_in 'Title', with: 'Harry Potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '6.99'
    fill_in 'Published-date', with: '06-28-1997'
    click_on 'Create Book'
    expect(page).to have_content("Published-date must be a valid date (DD-MM-YYYY)")
  end

  scenario 'invalid date (non-existant date)' do
    visit new_book_path
    fill_in 'Title', with: 'Harry Potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Price', with: '6.99'
    fill_in 'Published-date', with: '44-32-2025'
    click_on 'Create Book'
    expect(page).to have_content("Published-date must be a valid date (DD-MM-YYYY)")
  end
end