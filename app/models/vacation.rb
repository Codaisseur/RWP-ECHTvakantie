class Vacation < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  has_many :vphotos, dependent: :destroy

  has_and_belongs_to_many :themes


  # don't validate photos please!
  validates :title, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 500}

  validates :country, presence: true, length: {maximum: 20}
  validates :region, presence: true, length: {maximum: 20}
  validates :address, presence: true, length: {maximum: 50}

  validates :show, inclusion: [true, false]

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?


  AVAILABLE_FILTERS = {
    regio: RegionFilter,
    land: CountryFilter,
    prijsklasse: PriceFilter,
  }

  # In controller use following method like so Vacation.filtered("land/Spanje") of Vacation.filtered("prijs/echt-goedkoop")

  def self.filtered(filters)
    # this didn't seem to do anything
    # return self if filters.blank?

    results = self

    filters.split("/").in_groups_of(2) do |filter|
      type, value = filter
      if AVAILABLE_FILTERS.keys.include?(type.to_sym)
        filter = AVAILABLE_FILTERS[type.to_sym].new(value, results)
        results = filter.results
      end
    end

    results
  end

  def self.search(search)
    where("title ILIKE ? OR country ILIKE ? OR region ILIKE ? OR description ILIKE ? OR review ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
