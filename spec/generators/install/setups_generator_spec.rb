require 'spec_helper'

describe Toppings::Generators::Install::SetupsGenerator do

  within_source_root do |tempdir|
    tempdir = Pathname(tempdir)

    FileUtils.mkdir_p tempdir.join(stylesheets_path)
    FileUtils.touch tempdir.join(stylesheets_path).join("toppings.sass")
  end

  context "providing some base library setup files" do
    describe "the compass vertical grid system" do
      it "should be added" do
        subject.should generate(stylesheets_path.join("setups/_vertical_rhythm.sass")) { |content|

          # specifications for the generated content
          valid_sass?(content).should(be_true)
          content.should include("@import 'compass'")
          content.should include("$base-font-size: 16px")
        }
      end
    end

    describe "a responsive grid library (susy at the moment)" do
      it "should be added" do
        subject.should generate(stylesheets_path.join("setups/_responsive_grid.sass")) { |content|

          # specifications for the generated content
          valid_sass?(content).should(be_true)
          content.should include("@import 'susy'")
        }
      end
    end

    describe "the compass modular scale plugin" do
      it "should be added" do
        subject.should generate(stylesheets_path.join("setups/_modular_scale.sass")) { |content|

          # specifications for the generated content
          valid_sass?(content).should(be_true)
          content.should include("$ratio: golden();")
        }
      end
    end
  end

end
