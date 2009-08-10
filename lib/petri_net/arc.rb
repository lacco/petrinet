class PetriNet::Arc < PetriNet::Element
  property :source_id
  property :target_id

  attr_accessor :source
  attr_accessor :target

  def before_firing_callback
    true
  end

  def after_firing_callback
    true
  end

  def source=(s)
    raise ArgumentError unless s.kind_of?(PetriNet::Node)
    @source = s
    self.source_id = s.id
  end

  def source
    @source ||= net.nodes.find{|node| node.id == self.source_id}
  end

  def target=(t)
    raise ArgumentError unless t.kind_of?(PetriNet::Node)
    @target = t
    self.target_id = t.id
  end

  def target
    @target ||= net.nodes.find{|node| node.id == self.target_id}
  end
end
