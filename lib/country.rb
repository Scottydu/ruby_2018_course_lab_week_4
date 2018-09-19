# frozen_string_literal: true
class Country < ISO3166::Country
  def self.all_codes
    all.map(&:alpha2)
  end
end
