class Errand < ActiveRecord::Base
    belongs_to :person

    def self.find_cake
        find = self.all
        find.select {|errands| errands.errand.include?('cake')}
    end
end