class Days_to_ship < ActiveHash::Base
  self.data = [
    { id: 1, days_to_ship: '---' },
    { id: 2, days_to_ship: '１〜２日で発送' },
    { id: 3, days_to_ship: '２〜３日で発送' },
    { id: 4, days_to_ship: '３〜４日で発送' },
  ]

  include ActiveHash::Associations
  has_many :items

  end 