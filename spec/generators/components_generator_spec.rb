require 'spec_helper'

describe Toppings::Generators::ComponentsGenerator do
  context "generating a module fubar" do
    with_args "module" do

      with_args "fubar" do
        it "should generate a module css file called _fubar.sass" do
          subject.should generate(stylesheets_path.join("modules/_fubar.sass"))
        end
      end

      with_args "ganimed" do
        it "should append a new module to the modules base file" do
          subject.should generate(stylesheets_path.join("modules/_ganimed.sass")) {
            File.read(stylesheets_path.join("modules/_index.sass")).should =~ /\@import \"ganimed\"/
          }
        end
      end

    end

    context "generating a setting ganimed" do
      with_args "setting" do
        with_args "fubar" do
          it "should generate a settings css file called _fubar.sass" do
            subject.should generate(stylesheets_path.join("settings/_fubar.sass"))
          end
        end

        with_args "fubar" do
          it "should append a new settings file to the settings base file" do
            subject.should generate(stylesheets_path.join("settings/_fubar.sass")) {
              File.read(stylesheets_path.join("settings/_index.sass")).should =~ /\@import \"fubar\"/
            }
          end
        end
      end
    end
  end
end