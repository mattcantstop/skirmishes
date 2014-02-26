FactoryGirl.define do
  factory :user do
    first_name "Matthew"
    last_name "Duff"
    username "mattcantstop#{Random.rand(10000)}"
    password "encyrpted"
    encrypted_password "encrypted"
    email "matthewlduff#{Random.rand(10000)}@gmail.com"
  end
end
