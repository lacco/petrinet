class PetriNet::Node < PetriNet::Element
  def incoming_arcs
    self.net.arcs.select do |arc|
      arc.target_id == self.id
    end
  end

  def outgoing_arcs
    self.net.arcs.select do |arc|
      arc.source_id == self.id
    end
  end

  def incoming_nodes
    self.incoming_arcs.collect(&:source)
  end

  def outgoing_nodes
    self.outgoing_arcs.collect(&:target)
  end
end
