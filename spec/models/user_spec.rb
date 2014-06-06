require 'spec_helper'

describe User do
  it { should validate_presence_of :firstname }
  it { should validate_presence_of :lastname }
end
