class PetriNet::Element < CouchRest::ExtendedDocument
  property :id

  attr_accessor :net

  create_callback :before, :gen_id

protected
  def gen_id
    "pn"+rand(36**15).to_s(36)
  end
end
