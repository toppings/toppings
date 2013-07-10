require 'spec_helper'
require 'compass'

describe Toppings::Helper::SassConversionHelper do
  subject { SassConversionTest.new }

  describe "enabling a sass engine, with the custom options" do
    it { subject.sass_engine_options.should be_kind_of(Hash) }

    context "and handling load paths" do
      before do
        subject.load_paths
      end

      it { subject.sass_engine_options.should include(:load_paths) }

      context "with compass load paths included" do
        before do
          subject.load_compass_paths
        end

        it {
          compass_load_path = subject.load_paths.select { |load_path|
            load_path.to_s =~ /compass\/stylesheets/
          }
          compass_load_path.should_not be_empty
        }

        it {
          compass_load_path = subject.load_paths.select { |load_path|
            load_path.kind_of? Compass::SpriteImporter
          }
          compass_load_path.should_not be_empty
        }
      end

      context "with dependencies loaded" do
        before do
          subject.load_dependencies
        end

        describe "with susy available" do
          it {
            susy_load_path = subject.load_paths.select { |load_path|
              load_path.to_s =~ /susy-[\.\d]+\/sass/
            }
            susy_load_path.should_not be_empty
          }
        end
      end
    end
  end
end


class SassConversionTest
  include Toppings::Helper::SassConversionHelper
end