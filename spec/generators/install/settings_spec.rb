require 'spec_helper'

describe Toppings::Generators::Install::SettingsGenerator do

  within_source_root do |tempdir|
    tempdir = Pathname(tempdir)

    FileUtils.mkdir_p tempdir.join(stylesheets_path)
    FileUtils.touch tempdir.join(stylesheets_path).join("toppings.sass")
  end

  context "providing some base library settings files" do
    describe "with some colors" do
      it "should be added" do
        subject.should generate(stylesheets_path.join("settings/_colors.sass")) { |content|
          valid_sass?(content).should(be_true)
          content.should_not be_blank
        }
      end
    end

    describe "with some shadows" do
      it "should be added" do
        subject.should generate(stylesheets_path.join("settings/_shadows.sass")) { |content|
          valid_sass?(content).should(be_true)
          content.should_not be_blank
        }
      end
    end

    describe "with some typography" do
      it "should be added" do
        subject.should generate(stylesheets_path.join("settings/_typography.sass")) { |content|
          valid_sass?(content).should(be_true)
          content.should_not be_blank
        }
      end
    end
  end

end
