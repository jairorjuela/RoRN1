require 'rails_helper'

RSpec.describe Employee, type: :model do

  it "has one buyer" do
    assc = described_class.reflect_on_association(:tasks)
    expect(assc.macro).to eq :has_many
  end

  it "is valid with valid attributes" do
    expect(Employee.new(name: 'New Employee')).to be_valid
  end

end
