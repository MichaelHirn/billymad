require "spec_helper"

describe Billymad::Resource::CollectionProxy do
  subject { described_class.new }

  it { should respond_to(:associated_class, :params) }

  let(:associated_class) { Object }
  let(:associated_params) {{ key: 123 }}
  
  let(:collection) do
    subject.associated_class = associated_class
    subject.params = associated_params
    subject
  end

  it "allows to set #associated_class" do
    expect(collection.associated_class).to eq(associated_class)
  end

  it "allows to set #associated_params" do
    expect(collection.params).to eq(associated_params)
  end

  describe "#all" do
    it "returns collection" do
      associated_class.stub(:all).and_return([1,2,3])
      associated_class.should_receive(:all).with(associated_params.merge(name: "Bob")).and_return([1,2,3])
      expect(collection.all(name: "Bob")).to eq([1,2,3])
    end
  end

  describe "#create" do
    it "returns collection" do
      object = Object.new
      associated_class.stub(:create).and_return(object)
      associated_class.should_receive(:create).with(associated_params.merge(name: "Bob")).and_return(object)
      expect(collection.create(name: "Bob")).to eq(object)
    end
  end
end