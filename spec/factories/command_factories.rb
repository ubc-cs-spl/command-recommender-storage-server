FactoryGirl.define do
  factory :command do |f|
    f.user_id 'user_id'
    f.what 'what'
    f.kind 'kind'
    f.bundleVersion 'bundleVersion'
    f.description 'description'
    f.bindingUsed true
    f.bundleId 'bundle_id'
    f.time 1
  end
end