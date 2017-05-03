class Member
  include Mongoid::Document
  include Mongoid::Timestamps
  include Tenacity
  # include Mongoid::Enum

  # authenticates_with_sorcery!

  field :admin_id, type: Integer
  field :name, type: String
  field :email, type: String
  field :twitter, type: String
  field :facebook, type: String
  field :connpass, type: String
  field :note, type: String
  field :grade, type: Integer
  field :school_type, type: Integer
  field :school_name, type: String
  field :department, type: String

  # References
  t_belongs_to :admin
end
