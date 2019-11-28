#Eric Gorland

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

def reverse_list(list)
  temp_stack = Stack.new

  while list
    temp_stack.push(list.value)
    list = list.next_node
  end

  return temp_stack.data
end

class Stack
  attr_reader :data

  def initialize
    @data = nil
  end

  def push(value)
    @data = LinkedListNode.new(value, @data)
  end

  def pop
    if @data
      temp = @data
      if @data.next_node
        @data = LinkedListNode.new(@data.next_node.value, @data.next_node.next_node)
        return LinkedListNode.new(temp.value)
      else
        @data = nil
        return LinkedListNode.new(temp.value)
      end
    else
      return nil
    end
  end

end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node4 = LinkedListNode.new(100, node3)

print_values(node4)

puts "-----------"

revlist = reverse_list(node4)

print_values(revlist)





