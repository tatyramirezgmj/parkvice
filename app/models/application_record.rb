class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true



  def clean_number
    number = self.number.scan(/\d+/).join
    number[0] == "1" ? number[0] = '' : number
    number unless number.length != 20
  end


end
