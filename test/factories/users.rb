FactoryBot.define do
  factory :user do
    name              "Johndo"
    email             "herecomes@john.ny"
    password_digest   "password"
    fsa               "M3A"
    phone             1112223334
    # gender            "Male"
    # orientation       "straight"
    # looking_for       "friendship"
  end
end
