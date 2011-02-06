class Record
  include Mongoid::Document
  embedded_in :host, :inverse_of => :records
  field :average_load_1, :type => Float
  field :average_load_5, :type => Float
  field :average_load_15, :type => Float
end
