FactoryGirl.define do
  factory :article_history_default, class: ArticleHistory do
    user_id 1
    last_updated_user_id 1
    article_type_id 1
    article_id 1
    title "hello world"
    body "hogehoge"
    draft true
    version 1
  end
end
