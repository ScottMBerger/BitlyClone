class Url < ActiveRecord::Base
    validates :name, presence: true
    validates :short, presence: true, uniqueness: true
    validates :count, presence: true
end
