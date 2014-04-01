require 'rspec'
require_relative 'pizza'

describe Pizza do
  let(:pizza) { Pizza.new("Otter Pie") }

  it "should have a name" do
    pizza.should respond_to(:name)
  end

  it "should have a description" do
    pizza.should respond_to(:description)
  end

  it "should have a time_baked" do
    pizza.should respond_to(:time_baked)
  end

  context "#initialize" do
    it "creates a pizza object" do
      pizza.should be_an_instance_of Pizza
    end

    it "expects one parameter" do
      expect { Pizza.new }.to raise_error(ArgumentError)
    end

    it "sets name when initialized" do
      pizza.name.should eq "Otter Pie"
    end

    it "sets time_baked to 0 when initialized" do
      pizza.time_baked.should eq 0
    end

    it "does not accept an integer as a parameter" do
      pizza.name.should_not be_kind_of(Integer)
    end
  end
end
