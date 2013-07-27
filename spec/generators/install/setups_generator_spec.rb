require 'spec_helper'

describe Toppings::Generators::Install::SetupsGenerator do

  within_source_root do |tempdir|
    create_stylesheets_folder(tempdir)
    create_dummy_root_file(tempdir)
  end

  context "as a group of stylesheets" do
    it "should provide a relative base file" do
      subject.should generate(stylesheets_path.join("setups/_#{Toppings.conf.stylesheets.relative_index_file}.sass"))
    end
  end

  context "providing some base library setup files" do
    describe "the compass vertical grid system" do
      it "should be added" do
        subject.should generate_valid_sass_file(stylesheets_path.join("setups/_vertical_rhythm.sass")) { |content|
          content.should include("@import 'compass'")
          content.should include("$base-font-size: 16px")
        }
      end
    end

    describe "a responsive grid library (susy at the moment)" do
      it "should be added" do
        subject.should generate_valid_sass_file(stylesheets_path.join("setups/_responsive_grid.sass")) { |content|
          content.should include("@import 'susy'")
        }
      end
    end

    describe "the compass modular scale plugin" do
      it "should be added" do
        subject.should generate_valid_sass_file(stylesheets_path.join("setups/_modular_scale.sass")) { |content|
          content.should include("$ratio: golden();")
        }
      end
    end
  end

end
