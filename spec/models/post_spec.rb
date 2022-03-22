require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.first_or_create!(email: 'masudatuba@gmail.com', password: 'password', password_confirmation: 'password')

  it 'must have a valid title' do
    post = Post.new(title: nil,
                    body: 'my blogging body',
                    user: user)
    expect(post).to_not be_valid

    post.title = 'Hello world'
    expect(post).to be_valid
  end

  it 'can not have a null body' do
    post = Post.new(title: 'hello world',
                    body: nil,
                    user: user)
    expect(post).to_not be_valid

    post.body = '<p>This is my body</p>'
    expect(post).to be_valid
  end

  it 'can not have negative view' do
    post = Post.new(title: 'hello world',
                    body: '<p>This is my body</p>',
                    view: -2,
                    user: user)
    expect(post.valid?).to be_falsey
    expect(post.errors[:view]).to eq(['must be greater than or equal to 0'])

    post.view = 2
    expect(post.valid?).to be_truthy
  end
end

