require 'rails_helper'

RSpec.describe User, type: :model do
  it "nameとemailとpasswordが空ならバリデーションが通らない" do
    user = User.new(name: '',email: '',password: '')
    expect(user).not_to be_valid
  end

  it "nameが空ならバリデーションが通らない" do
    user = User.new(name: '',email:'jon@gmail.com',password:'123456')
    expect(user).not_to be_valid
  end

  it "emailが空ならバリデーションが通らない" do
    user = User.new( name:'jon',email: '', password:'123456')
    expect(user).not_to be_valid
  end

  it "passwordが空ならバリデーションが通らない" do
    user = User.new( name:'jon', email:'jon@gmail.com',password_digest: '')
    expect(user).not_to be_valid
  end

  it "すべて記入済みならバリデーションが通る" do
    user = User.new( name:'jon', email:'jon@gmail.com', password:'123456')
    expect(user).to be_valid
  end
end
