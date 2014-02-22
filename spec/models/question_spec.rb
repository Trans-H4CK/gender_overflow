require 'spec_helper'

describe Question do
  it { should have_db_column(:question) }
  it { should belong_to(:category) }
  it { should belong_to(:user) }
  it { should have_many(:answers) }
end
