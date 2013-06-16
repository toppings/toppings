require 'spec_helper'

describe Toppings::Generators::ModulesGenerator do
  context "generating a module fubar" do

    with_args "fubar" do
      it "should generate a module css file called _fubar.css.sass" do
        subject.should generate(stylesheets_path.join("modules/_fubar.css.sass"))
      end
    end
  end
end