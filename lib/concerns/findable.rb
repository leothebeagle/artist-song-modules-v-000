module Findable

  def find_by_name(name)
    self.all.detect { |instance| instance.name == name}
  end

end
