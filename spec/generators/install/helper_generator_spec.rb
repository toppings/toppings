require 'spec_helper'

describe Toppings::Generators::Install::HelperGenerator do

  within_source_root do |tempdir|
    tempdir = Pathname(tempdir)

    FileUtils.mkdir_p tempdir.join(stylesheets_path)
    FileUtils.touch tempdir.join(stylesheets_path).join("toppings.sass")
  end

  context "providing some useful helper files" do
    describe "a debug helper" do
      it "should be created" do
        subject.should generate(stylesheets_path.join("helper/_debug.sass")) { |content|
          valid_sass?(content).should(be_true)
          content.should include('$debug-color: #fff')
        }
      end
    end
  end

end
