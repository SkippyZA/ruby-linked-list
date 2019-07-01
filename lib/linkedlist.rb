# Node class for LinkedList
class LinkedListNode
  # Data for LinkedListNode
  attr_accessor :data
  # Reference to next LinkedListNode
  attr_accessor :next

  # Create a LinkedListNode with supplied data
  def initialize(data)
    @data = data
    @next = nil
  end
end

# Linked list data structure
class LinkedList
  # Initialize an empty LinkedList
  def initialize()
    @head = nil
    @tail = nil
  end

  # Add data to the end of the linked list
  #
  # * +data+ - data to store in list
  def append(data)
    newNode = LinkedListNode.new data

    if @head.nil?
      @head = newNode
    else
      @tail.next = newNode
    end

    @tail = newNode
    self
  end

  # Insert data at a specific position of the list
  #
  # * +pos+ - Position in list to insert data
  # * +data+ - Data to insert
  def insert_at(pos, data)
    newNode = LinkedListNode.new data

    if (pos == 0)
      newNode.next = @head
      @head = newNode
    else
      node = @head

      (pos - 1).times do
        node = node.next
      end

      newNode.next = node.next
      node.next = newNode
    end

    if newNode.next.nil?
      @tail = newNode
    end

    self
  end

  # Remove a node from the list at the specified position
  #
  # * +pos+ - Position in list to remove node
  def delete_at(pos)
    node = @head

    if pos == 0
      @head = node.next
    else
      (pos -1).times do
        node = node.next
      end

      node.next = node.next.next
    end

    if node.next.nil?
      @tail = node
    end
  end

  # Return a new reversed LinkedList
  def reverse()
    list = LinkedList.new

    reverse_list = Proc.new do |node|
      if not node.next.nil?
        reverse_list.call(node.next)
      end

      list.append(node.data)
    end

    reverse_list.call(@head)
  end

  # Reverse this linked list in place (Destructive)
  def reverse!()
    new_tail = @head
    current = @head
    previous = nil

    while not current.nil? do
      next_node = current.next
      current.next = previous
      previous = current
      current = next_node
    end

    @head = previous
    @tail = new_tail

    self
  end

  # Return the entire linked list as an array
  def to_a()
    list_array = []
    node = @head

    while not node.nil? do
      list_array.push node.data
      node = node.next
    end

    list_array
  end
end
