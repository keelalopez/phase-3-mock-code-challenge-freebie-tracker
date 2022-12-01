class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    # Can access Company.first.freebies
    
    # Returns a collection of all the devs who collected freebies from the company
    def devs
        self.freebies.each do |f|
            f.dev
        end
    end

    def give_freebie(dev, item_name, value)
        Freebie.create(item_name: item_name, value: value, dev_id: dev.id, company_id: self.id)
    end

    # missed this method on the first try 
    def self.oldest_company
        # self.order( founding_year :asc).first
        # self.all.min_by {|c| c.founding_year}
        self.order( :founding_year ).first

            # LIANZI's
        # Company.all.map {|company| company.founding_year}.min()
        # Company.where(founding_year: year)
    end

end

#Company.last.freebies.last.dev