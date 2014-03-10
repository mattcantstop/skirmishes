FactoryGirl.define do
  factory :user do
    first_name "Matthew"
    last_name "Duff"
    username "mattcantstop#{Random.rand(10000)}"
    password "encrypted"
    password_confirmation "encrypted"
    email "matthewlduff#{Random.rand(10000)}@gmail.com"
    authentication_token "a_token"
  end
end
