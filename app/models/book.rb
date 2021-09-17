class Book < ApplicationRecord
    validates :title, presence: { message: " can't be blank" }
    validates :author, presence: { message: " can't be blank" }
    validates :price, presence: { message: " can't be blank" }, numericality: { message: " must be a number" }
    validates :'published-date',
        format: {
            with: /\A((\d{4})-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))|((0[1-9]|[12]\d|3[01])-(0[1-9]|1[0-2])-(\d{4}))\z/,
            message: " must be a valid date (DD-MM-YYYY)"
        }
end
