require 'rspec'
require_relative 'pizza.rb'

describe Pizza do
  let(:pizza) { Pizza.new("Otter Pie") }

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

    it "does not accept an integer as a parameter" do
      pizza.name.should_not be_kind_of(Integer)
    end
  end

  pizza

end
