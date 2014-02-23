require 'spec_helper'

describe Category do
  it { should have_db_column(:name) }
  it { should have_db_column(:lft) }
  it { should have_db_column(:rgt) }
  it { should have_db_column(:parent_id) }
  it { should have_many(:questions) }

  describe "all questions" do
  end
end