# coding: utf-8
FactoryGirl.define do
  sequence :name do |n|
    "Author_#{n}"
  end

  factory :author do
    name { Factory.next(:name) }
  end
end
