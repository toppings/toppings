require 'spec_helper'

describe Toppings::Generators::Install::ModulesGenerator do

  within_source_root do |tempdir|
    tempdir = Pathname(tempdir)

    FileUtils.mkdir_p tempdir.join(stylesheets_path)
    FileUtils.touch tempdir.join(stylesheets_path).join("toppings.sass")
  end

  context "as a group of stylesheets" do
    it "should provide a relative base file" do
      subject.should generate(stylesheets_path.join("modules/_base.sass"))
    end
  end

end
