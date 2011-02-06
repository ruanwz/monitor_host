class Host
  include Mongoid::Document
  field :mac

  referenced_in :users
  embeds_many :records
end
