class Director < ActiveRecord::Base
  has_many :films

  def total_box_office
    self.films.sum('box_office_sales')
  end
end
