class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues
  before_validation :normalize_name, on: :create
  after_validation :normalize_name, on: :update
  validates :name, {presence: true, uniqueness: { case_sensitive: false}}

  private
    def normalize_name
      self.name = self.name.downcase.titleize
    end
end
