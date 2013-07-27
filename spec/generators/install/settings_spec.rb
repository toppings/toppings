require 'spec_helper'

describe Toppings::Generators::Install::SettingsGenerator do

  within_source_root do |tempdir|
    create_stylesheets_folder(tempdir)
    create_dummy_root_file(tempdir)
  end

  context "as a group of stylesheets" do
    it "should provide a relative base file" do
      subject.should generate(stylesheets_path.join("settings/_#{Toppings.conf.stylesheets.relative_index_file}.sass"))
    end
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
