class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    # Access all frebies Dev.first.freebies

    def companies
        self.freebies.each do |c|
            c.company
        end
    end

    # not sure if this one is working 
    def received_one?(item_name)
        #HENRY's option
        # !! => turns an instance to a boolean of true, if existing
        # !!self.freebies.find_by( item_name: item_name)

        # LINDSAYS
        # self.freebies.find_by(item_name: item_name)? true : false

        #Adam's review
        self.freebies.each do |freebie|
            if item.name === freebie.item_name
                return true
            end
            return false 
        end
        
    end

    # NOT COMPLETED 
    def give_away(dev_to_get_freebie, freebie)
        #ADAMS review
        if self.id == freebie.dev.id
            freebie.update( dev_id: dev_to_get_freebie.id)
        else
            puts 'DO NOT GIVE WHAT IS NOT YOURS'
        end

        # LINDSAYS
        # def give_away(dev, freebie)
        #     if self.received_one?(freebie.item_name)
        #         freebie.update(dev_id: dev.id)
        #     else
        #         "Sorry buddy, I got no freebie for youuu!"
        #     end
        # end

    end

end

# Dev.first.freebies.first.company

# self.freebies.each do |f|
#     if f.item_name === item_name 
#         puts true
#     # else
#     #     puts false
#     end
#     # return false
# end