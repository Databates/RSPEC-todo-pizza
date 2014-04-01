require 'rspec'
require_relative 'pizza'

describe Topping do
  let(:topping) { Topping.new("Shitake", 10) }

  context "#initialize" do
    it {should respond_to(:name, :required_bake_time, :time_baked) }

    it "should have a name" do
      topping.name.should eq "Shitake"
    end

    it "should have a default time_baked of 0" do
      topping.time_baked.should eq 0
    end

    it "should have an integer as required_bake_time" do
      topping.required_bake_time.should be_an_instance_of Integer
    end
  end

  it { should respond_to(:bake).with(1).argument }

  it "should set time_baked in seconds by the integer argument passed in minutes" do
    topping.bake(10)
    topping.time_baked.should eq 600
  end
end

describe Pizza do
  let(:pizza) { Pizza.new("Otter Pie") }

  # A pizza should have attributes name
  it "should have a name" do
    pizza.should respond_to(:name)
  end

  # A pizza should have attributes description
  it "should have a description" do
    pizza.should respond_to(:description)
  end

  # A pizza should have attributes time_baked
  it "should have a time_baked" do
    pizza.should respond_to(:time_baked)
  end

  # A pizza has many toppings
  it { should have_at_least(1).toppings }

  context "#required_bake_time" do
    # A pizza should have a method required_bake_time
    it "should have a required_bake_time method" do
      pizza.should respond_to(:required_bake_time)
    end

    # which returns the sum of 900 (15 minutes) plus the maximum bake time of all its toppings
    it "should return a required bake time of 900 seconds plus the max bake time of all its toppings" do
      max_topping_time = pizza.toppings.max_by { |topping| topping.bake_time }
      pizza.required_bake_time.should eq (900 + max_topping_time)
    end
  end

  context "#bake" do
    # A pizza should have a method bake(time)
    it {should respond_to(:bake).with(1).argument }

    # which increments time_baked by the integer argument time
    it "should set time_baked in seconds by the integer argument passed in minutes" do
      pizza.bake(10)
      pizza.time_baked.should eq 600
    end

    # and invokes bake(time) on all of its toppings
    it "should invoke #bake on all its toppings" do
      pizza.toppings.each do |topping|
        topping.should respond_to(:bake).with(1).argument
      end
    end
  end

  context "#initialize" do
    it "creates a pizza object" do
      pizza.should be_an_instance_of Pizza
    end

    it "expects one parameter" do
      expect { Pizza.new }.to raise_error(ArgumentError)
    end

    # A pizza must be initialized with string name
    it "sets name when initialized" do
      pizza.name.should eq "Otter Pie"
    end

    # A pizza's time_baked defaults to 0
    it "sets time_baked to 0 when initialized" do
      pizza.time_baked.should eq 0
    end

    it "does not accept an integer as a parameter" do
      pizza.name.should_not be_kind_of(Integer)
    end



  end

  it "should indicate the baked status" do
  end
end
