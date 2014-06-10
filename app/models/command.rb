class Command
  include MongoMapper::Document

  key :user_id, String
  key :what, String
  key :kind, String
  key :bundleVersion, String
  key :description, String
  key :bindingUsed, Boolean
  key :time, Integer

  validates_presence_of :user_id
  validates_presence_of :what
  validates_presence_of :kind
  validates_presence_of :bundleVersion
  validates_presence_of :description
  validates_presence_of :bindingUsed
  validates_presence_of :time
  validates_numericality_of :time
end
