class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} -->"
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def is_infinite(list_node)
  if list_node && list_node.next_node
    tortoise = list_node
    hare = list_node.next_node
  else
    return false
  end

  while tortoise && hare
    if tortoise == hare
      return true
    end

    if list_node && list_node.next_node && list_node.next_node.next_node
      tortoise = tortoise.next_node
      hare = hare.next_node.next_node
    else
      return false
    end
  end

  return false
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(50, node3)
node5 = LinkedListNode.new(38, node4)

puts "#{is_infinite(node5)}"

node1.next_node = node5

puts "#{is_infinite(node5)}"