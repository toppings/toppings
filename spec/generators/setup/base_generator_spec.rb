require 'spec_helper'

describe Toppings::Generators::Setup::BaseGenerator do

  context "as setup generator base class" do

    context "with naming conventions" do

      describe "the class name" do
        it { subject[:described].stripped_class_name.should eq("BaseGenerator") }
      end

      describe "the classes base name" do
        it { subject[:described].base_name.should eq("base") }
      end

    end

    it "should output the invocation of the base generator" do
      subject.should output("invoke Setup::BaseGenerator")
    end

    it "should provide the main template path" do
      subject[:described].source_root.should_not be_nil
    end

  end


end