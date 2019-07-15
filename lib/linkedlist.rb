# Node class for LinkedList
class LinkedListNode
  # Data for LinkedListNode
  attr_accessor :data
  # Reference to next LinkedListNode
  attr_accessor :next

  # Create a LinkedListNode with supplied data
  #
  # @param data [any] Data for node
  def initialize(data)
    @data = data
    @next = nil
  end
end

# Linked list data structure
class LinkedList
  attr_accessor :head, :tail

  # Initialize an empty LinkedList
  def initialize()
    @head = nil
    @tail = nil
  end

  # Add data to the end of the linked list
  #
  # @param data [any] data to store in list
  #
  # @return [LinkedList]
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
  # @param pos [Number] Position in list to insert data
  # @param data [any] Data to insert
  #
  # @return [LinkedList]
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
  # @param pos [Number] Position in list to remove node
  #
  # @return [LinkedList]
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
  #
  # @return [LinkedList]
  def reverse()
    list = LinkedList.new

    reverse_list = Proc.new do |node|
      unless node.next.nil?
        reverse_list.call(node.next)
      end

      list.append(node.data)
    end

    reverse_list.call(@head)
  end

  # Reverse this linked list in place (Destructive)
  #
  # @return [LinkedList]
  def reverse!()
    new_tail = @head
    current = @head
    previous = nil

    until current.nil? do
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
  #
  # @return [Array]
  def to_a()
    list_array = []
    node = @head

    until node.nil? do
      list_array.push node.data
      node = node.next
    end

    list_array
  end

  # Find the Node where the two LinkedList merge
  #
  # @example Merges at 2
  #   1
  #    \
  #     2 -- 3 -- NULL
  #    /
  #   1
  #
  # @example Merges at 3
  #   1 -- 2
  #         \
  #          3 -- Null
  #         /
  #        1
  #
  # @param list_1 [LinkedList] List A
  # @param list_2 [LinkedList] List B
  #
  # @return [LinkedListNode]
  def self.find_merge_node(list_1, list_2)
    list_2_object_ids = []

    # create a hash object of object ids for list_2
    current = list_2.head
    until current.nil?
      list_2_object_ids.push(current.object_id)
      current = current.next
    end

    # using list_1, return the node when its object id is in the hash
    current = list_1.head
    until current.nil?
      if list_2_object_ids.include?(current.object_id)
        return current
      end

      current = current.next
    end
  end
end
