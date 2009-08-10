require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "PetriNet::Net" do
  before :all do
    @net = PetriNet::Net.new({
      :places => [
        {:name => "Blub1", :id => "my_place"}
      ],
      :transitions => [
        {:name => "Transition", :id => "my_transition"}
      ],
      :arcs => [
        {:source_id => "my_place", :target_id => "my_transition"}
      ]
    })
  end

  it "should have defined places and transitions" do
    @net.places.size.should == 1
    @net.transitions.size.should == 1
  end

  it "should have arcs with correct source and targets" do
    @net.arcs.size.should == 1

    arc = @net.arcs.first

    arc.source.should be_kind_of(PetriNet::Place)
    arc.target.should be_kind_of(PetriNet::Transition)

    arc.source.id.should == "my_place"
    arc.target.id.should == "my_transition"
  end

  it "should set the incoming and outgoings correctly" do
    place = @net.places.first
    transition = @net.transitions.first
    arc = @net.arcs.first

    place.incoming_arcs.should == []
    place.incoming_nodes.should == []

    place.outgoing_arcs.should == [arc]
    place.outgoing_nodes.should == [transition]

    transition.incoming_arcs.should == [arc]
    transition.incoming_nodes.should == [place]

    transition.outgoing_arcs.should == []
    transition.outgoing_nodes.should == []
  end
end
