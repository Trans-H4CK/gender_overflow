require 'spec_helper'

describe Vote do
  it { should have_db_column(:type) }
  it { should belong_to(:user) }
  it { should belong_to(:votable) }
end