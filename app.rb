class App
  def initialize(items)
    @items = items
    @list = []
  end

  def call
    start_item = items.select { |item| item.ord >= 65 }.sort.first
    @list << start_item
    sort_items(start_item)
    list
  end

  private

  attr_reader :items, :list

  def sort_items(item)
    last_char = item.chars.last

    result = items.find { |i| i.start_with?(last_char) }

    return if result.nil?

    @list << result
    sort_items(result)
  end
end

list = ['A...%', 'D====K', '%____D', 'K*****&', '&!!!!!X', 'Y...Z', 'X8888Y']

puts App.new(list).call