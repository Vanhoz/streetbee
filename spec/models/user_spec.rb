require 'rails_helper'

# Test suite for the Todo model
RSpec.describe User, type: :model do
  it { should have_many(:uploads) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end