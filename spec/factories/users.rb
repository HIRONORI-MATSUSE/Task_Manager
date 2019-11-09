FactoryBot.define do

  #userのままであれば、class: Userは書かなくていいが、
  #userから名前を変える場合は、class: モデル名を記述する。

  factory :first_user, class: User do
    name { 'jon' }
    email { 'jon@gmail.com' }
    password { '123456' }
    id {1}
    admin { false }
    # password_cofirmation { '123456' }
  end

  factory :second_user, class: User do
    name { 'sum' }
    email { 'sum@gmail.com' }
    password { '123456' }
    id {2}
    admin { false }
    # password_cofirmation { '123456' }
  end
  

  factory :third_user, class: User do
    name { 'alice' }
    email { 'alice@gmail.com' }
    password { '123456' }
    id {3}
    admin { true }
    # password_cofirmation { '123456' }
  end
end
