class PetriNet::Net < CouchRest::ExtendedDocument
  use_database PetriNet::DB

  view_by :_id

  def self.find_by_id(id)
    self.by__id(:key => id).first
  end

  property :places, :cast_as => ['PetriNet::Place']
  property :transitions, :cast_as => ['PetriNet::Transition']
  property :arcs, :cast_as => ['PetriNet::Arc']
  property :name

  def initialize(*args)
    super
    self.places ||= []
    self.transitions ||= []
    self.arcs ||= []

    (self.transitions + self.places + self.arcs).each do |node|
      node.net = self
    end
  end

  # Returns map of transition => array of array of tokens
  def enabled_transitions
  end

  def fire(transition, tokens = nil)
    raise "Transition not enabled "
  end

  def nodes
    self.transitions + self.places
  end
end
