require 'spec_helper'

describe Answer do
  it { should have_db_column(:answer) }
  it { should_not have_db_column(:cheese) }
  it { should belong_to(:user) }
  it { should belong_to(:question) }
end
