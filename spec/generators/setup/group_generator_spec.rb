require 'spec_helper'

describe Toppings::Generators::Install::GroupGenerator do

  describe "sporting multiple stylesheet files" do
    within_source_root do |tempdir|
      tempdir = Pathname(tempdir)

      FileUtils.mkdir_p tempdir.join(stylesheets_path)
      FileUtils.touch tempdir.join(stylesheets_path).join("toppings.css.sass")
    end

    context "a group file" do
      it "should be generated" do
        subject.should generate(stylesheets_path.join("group/_base.css.sass"))
      end

      it "should be appended to the base file" do
        subject.should generate(stylesheets_path.join('toppings.css.sass')) { |content|
          content.should =~ /\@import \"group\/base\"/
        }
      end
    end
  end

end
