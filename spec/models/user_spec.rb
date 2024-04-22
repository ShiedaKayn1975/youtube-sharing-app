require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(password: 'some_password', email: 'john@doe.com', name: 'John')
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid without a email' do
    subject.email = nil
    expect(subject).to be_invalid
  end

  it 'is invalid without a name' do
    subject.name = nil
    expect(subject).to be_invalid
  end

  it 'is invalid without a passoword' do
    subject.password = nil
    expect(subject).to be_invalid
  end
end
