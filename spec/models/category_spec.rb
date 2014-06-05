require 'spec_helper'

describe Category do
  it { should validate_uniqueness_of(:name) }
end
