require 'spec_helper'

describe User do
  it { should have_db_column(:email) }
  it { should have_many(:questions)}
  it { should have_many(:answers) }
end
