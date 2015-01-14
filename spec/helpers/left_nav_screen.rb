class LeftNavScreen < ProMotion::TableScreen
  attr_accessor :got_will_appear, :got_did_appear

  def will_appear
    @got_will_appear = true
  end

  def did_appear
    @got_did_appear = true
  end

  def table_data
    [{
      title: nil,
      cells: [{
        title: 'OVERWRITE THIS METHOD'
      }]
    }]
  end
end
