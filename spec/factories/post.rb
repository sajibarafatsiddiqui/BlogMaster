FactoryBot.define do
  factory :post do
    title { 'Test Post' }
    text { 'Test post content.' }
    commentscounter { 0 }
    likescounter { 0 }
  end
end
