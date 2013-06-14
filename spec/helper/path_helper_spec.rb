require 'spec_helper'

describe Toppings::Helper::PathHelper do
  subject { PathHelperTest }

  context "assisting template usage" do
    describe "the template path, based on the gem root" do
      it { subject.template_path.to_s.should match(Toppings.gem_root) }
    end
  end
end

class PathHelperTest
  include Toppings::Helper::PathHelper
end