require 'spec_helper'
require 'sass'

describe Toppings::Generators::Install::HelperGenerator do
  within_source_root do |tempdir|
    tempdir = Pathname(tempdir)

    FileUtils.mkdir_p tempdir.join(stylesheets_path)
    FileUtils.touch tempdir.join(stylesheets_path).join("toppings.sass")
  end

  context "with naming conventions" do
    it "should be generated" do
      subject.should generate(stylesheets_path.join("helper/_debug.sass")) { |content|
        valid_sass?(content).should be_true
      }

    end
  end

end
