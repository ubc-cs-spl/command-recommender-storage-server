class CommandDetail
  include MongoMapper::Document

  key :command_name, String
  key :command_id, String, :required => true, :unique => true
  key :description, String
  key :shortcut, String
  key :mac_shortcut, String

end
