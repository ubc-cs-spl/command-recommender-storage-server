class Command
  include MongoMapper::Document

  key :user_id, String, :required => true
  key :what, String, :required => true
  key :kind, String, :required => true
  key :bundleVersion, String, :required => true
  key :bundleId, String, :required => true
  key :description, String, :required => true
  key :bindingUsed, Boolean
  key :time, Integer, :required => true, :numeric => true

end
