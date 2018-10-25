require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Upload, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:photo) }
end