class Store < ActiveRecord::Base
  has_many :employees

    # Validations
  # Ensures that the store has a name and that the name is at least 3 characters long.
  validates :name, presence: true, length: { minimum: 3 }

  # Ensures that the annual revenue is a non-negative integer.
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Custom validation to ensure that the store carries at least one of the men's or women's apparel.
  validate :must_carry_mens_or_womens_apparel

  private

  # Custom validation method to check if the store carries at least one type of apparel.
  def must_carry_mens_or_womens_apparel
    # If neither men's apparel nor women's apparel is true, add an error to the base of the record.
    if !mens_apparel && !womens_apparel
      errors.add(:base, "Stores must carry at least one of the men's or women's apparel")
    end
  end

end
