class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues
  validates :name, {presence: true, uniqueness: { case_sensitive: false}}

  before_validation :normalize_name, on: :create

  private
    def normalize_name
      self.name = self.name.downcase.titleize
    end

end
