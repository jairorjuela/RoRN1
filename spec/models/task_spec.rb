require 'rails_helper'

RSpec.describe Task, type: :model do

  it "has one buyer" do
    assc = described_class.reflect_on_association(:employee)
    expect(assc.macro).to eq :belongs_to
  end

  it "is valid with valid attributes" do
    employee = Employee.create(:name => 'Test')
    expect(Task.new(name: 'New task', employee: employee)).to be_valid
  end

  it "is valid with valid attributes" do
    expect(Task.new(name: 'New task')).to_not be_valid
  end

  it "is not valid without a name" do
    task = Task.new(name: nil)
    expect(task).to_not be_valid
  end

end
