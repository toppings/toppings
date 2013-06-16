require 'spec_helper'

describe Toppings::Generators::ModulesGenerator do
  context "generating a module fubar" do

    with_args "fubar" do
      it "should generate a module css file called _fubar.css.sass" do
        subject.should generate(stylesheets_path.join("modules/_fubar.css.sass"))
      end
    end


    with_args "ganimed" do
      it "should append a new module to the modules base file" do
        subject.should generate(stylesheets_path.join("modules/_ganimed.css.sass")) {
          File.read(stylesheets_path.join("modules/_base.css.sass")).should =~ /\@import \"ganimed\"/
        }
      end
    end
  end
end