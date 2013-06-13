require 'spec_helper'

describe Toppings::Config do
  describe "at initialization" do
    context "with some attributes assigned" do
      subject { Toppings::Config.new attr1: "fu" }

      describe "asking for attr1" do
        it { subject.attr1.should eq("fu") }
      end

      describe "setting a new attribute attr2" do
        it { subject.attr2=("bar").should eq("bar") }
      end
    end

    context "with nested configuration attributes" do
      subject { Toppings::Config.new attr1: { attr2: "fubar" } }

      describe "asking for the nested attribute attr2" do
        it { subject.attr1.attr2.should eq("fubar")}
      end
    end
  end
end
