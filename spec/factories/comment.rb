FactoryGirl.define do
  factory :comment_default, class: Comment do
    user_id 1
    article_id 1
    body "hello comment"
  end
end
