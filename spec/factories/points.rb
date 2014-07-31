# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :point, :class => 'Points' do
    given_to "MyString"
    given_by "MyString"
    project "MyString"
    task "MyString"
    comment "MyText"
    manager "MyString"
  end
end
