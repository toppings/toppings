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
        subject.should generate_valid_sass_file(stylesheets_path.join("settings/_colors.sass"))
      end
    end

    describe "with some shadows" do
      it "should be added" do
        subject.should generate_valid_sass_file(stylesheets_path.join("settings/_shadows.sass"))
      end
    end

    describe "with some typography" do
      it "should be added" do
        subject.should generate_valid_sass_file(stylesheets_path.join("settings/_typography.sass"))
      end
    end

    describe "with some dimensions" do
      it "should be added" do
        subject.should generate_valid_sass_file(stylesheets_path.join("settings/_dimensions.sass"))
      end
    end

    describe "with some borders" do
      it "should be added" do
        subject.should generate_valid_sass_file(stylesheets_path.join("settings/_borders.sass"))
      end
    end
  end
end
