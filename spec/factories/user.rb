FactoryGirl.define do
  factory :user_default, class: User do
    name "taro"
    email "hoge@hoge.com"
    email_confirmation "hoge@hoge.com"
    password "password"
  end
end
