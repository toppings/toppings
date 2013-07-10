require 'spec_helper'
require 'compass'

describe Toppings::Helper::SassConversionHelper do
  subject { SassConversionTest.new }

  describe "enabling a sass engine, with custom options" do
    it { subject.sass_engine_options.should be_kind_of(Hash) }

    context "by handling load paths" do
      before do
        subject.load_paths
      end

      it { subject.sass_engine_options.should include(:load_paths) }

      context "adding some libraries multiple times" do
        before do
          # using the compass load_paths as an example
          subject.load_compass_paths
          subject.load_compass_paths
        end

        describe "each load path should appear only once" do
          it {
            subject.load_paths.select { |load_path|
            load_path.to_s =~ /compass\/stylesheets/
          }.size.should eq(1)
          }
        end

      end
      context "with compass load paths included" do
        before do
          subject.load_compass_paths
        end

        describe "the compass stylesheet dependencies" do
          it {
            subject.load_paths.select { |load_path|
              load_path.to_s =~ /compass\/stylesheets/
            }.should_not be_empty
          }
        end

        describe "the SpriteImporter" do
          it {
            subject.load_paths.select { |load_path|
              load_path.kind_of? Compass::SpriteImporter
            }.should_not be_empty
          }
        end
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

  context "in approving given sass content" do
    context "assuming external sass dependencies" do
      before do
        # we mock a dumb engine here, because we check the dependency loading only
        # before we dive deeper into the sass engine creation itself.
        @sass_engine = mock("SassEngine")
        @sass_engine.stub(:render).and_return(true)

        Sass::Engine.stub(:new).and_return(@sass_engine)
      end

      it "the dependencies should be required and loaded" do
        # we check here, that the dependency loading is initialized as
        # specified in the tests above, nothing more, nothing less :)
        subject.should_receive(:load_dependencies)
        subject.valid_sass?("fubar")
      end

      # TODO: make the dependencies configurable and specify its behavior here! (fh)
    end

  end

end


class SassConversionTest
  include Toppings::Helper::SassConversionHelper
end