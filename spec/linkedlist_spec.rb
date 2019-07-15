# frozen_string_literal: true

require 'linkedlist'

RSpec.describe LinkedList do
  context '#append' do
    it 'adds to the end of the list' do
      list = LinkedList.new
      list.append 1
      list.append 2
      list.append 3

      expect(list.to_a).to eq [1, 2, 3]
    end
  end

  context '#insert_at' do
    it 'should insert in the middle of the list' do
      list = LinkedList.new
      list.append 1
      list.append 2
      list.append 3

      list.insert_at(2, 10)

      expect(list.to_a).to eq [1, 2, 10, 3]
    end

    it 'should insert at the head of the list when adding at position 0' do
      list = LinkedList.new
      list.append 1
      list.append 2

      list.insert_at(0, 10)

      expect(list.to_a).to eq [10, 1, 2]
    end

    it 'should insert at the end of the list' do
      list = LinkedList.new
      list.append 1
      list.append 2

      list.insert_at(2, 10)

      expect(list.to_a).to eq [1, 2, 10]
    end

    it 'should insert at the head as the only value' do
      list = LinkedList.new

      list.insert_at(0, 10)

      expect(list.to_a).to eq [10]
    end
  end

  context '#delete_at' do
    it 'should remove the head of the list' do
      list = LinkedList.new
      list.append 1
      list.append 2
      list.append 3

      list.delete_at 0

      expect(list.to_a).to eq [2, 3]
    end

    it 'should delete data in the middle of the list' do
      list = LinkedList.new
      list.append 1
      list.append 2
      list.append 3

      list.delete_at 1

      expect(list.to_a).to eq [1, 3]
    end

    it 'should remove the last value of the list' do
      list = LinkedList.new
      list.append 1
      list.append 2
      list.append 3

      list.delete_at 2

      expect(list.to_a).to eq [1, 2]
    end
  end

  context '#reverse' do
    it 'should return a reversed linked list' do
      list = LinkedList.new
      list.append 1
      list.append 2
      list.append 3

      expect(list.reverse.to_a).to eq [3, 2, 1]
      expect(list.to_a).to eq [1, 2, 3]
    end
  end

  context '#reverse!' do
    it 'should reverse the order of the linked list' do
      list = LinkedList.new
      list.append 1
      list.append 2
      list.append 3
      list.append 4
      list.append 5
      list.append 6

      list.reverse!

      expect(list.to_a).to eq [6, 5, 4, 3, 2, 1]
    end
  end

  context '#find_merge_node' do
    it 'should return nil if no merge node found' do
      # List 1
      list1 = LinkedList.new
      list1.append 1
      list1.append 2
      list1.append 3

      # List 2
      list2 = LinkedList.new
      list2.append 21
      list2.append 22
      list2.append 23

      expect(LinkedList.find_merge_node(list1, list2)).to be_nil
    end

    it 'should return the head node when supplying the same list as both arguments' do
      # Initialize shared list
      head_shared_node = LinkedListNode.new(1000)
      head_shared_node.next = LinkedListNode.new(2001)
      head_shared_node.next.next = LinkedListNode.new(2002)
      head_shared_node.next.next.next = LinkedListNode.new(2003)
      head_shared_node.next.next.next.next = LinkedListNode.new(2004)
      tail = head_shared_node.next.next.next.next

      # List
      list1 = LinkedList.new
      list1.head = head_shared_node
      list1.tail = tail

      # Get the merge node and assert
      merge_node = LinkedList.find_merge_node(list1, list1)
      expect(merge_node).to be head_shared_node
    end

    it 'should return the merge node' do
      # Initialize shared list
      head_shared_node = LinkedListNode.new(1000)
      head_shared_node.next = LinkedListNode.new(2001)
      head_shared_node.next.next = LinkedListNode.new(2002)
      head_shared_node.next.next.next = LinkedListNode.new(2003)
      head_shared_node.next.next.next.next = LinkedListNode.new(2004)
      tail = head_shared_node.next.next.next.next

      # List 1
      list1 = LinkedList.new
      list1.append 1
      list1.append 2
      list1.append 3

      list1.tail.next = head_shared_node
      list1.tail = tail

      # List 2
      list2 = LinkedList.new
      list2.append 21
      list2.append 22
      list2.append 23

      list2.tail.next = head_shared_node
      list2.tail = tail

      # Get the merge node and assert
      merge_node = LinkedList.find_merge_node(list1, list2)
      expect(merge_node).to be head_shared_node
    end
  end

  context 'merge_lists' do
    it 'should merge 2 sorted lists' do
      list1 = LinkedList.new
      list1.append 1
      list1.append 2
      list1.append 3
      list1.append 4

      list2 = LinkedList.new
      list2.append 3
      list2.append 6

      merged_list = LinkedList.merge_lists(list1, list2)
      expected_result = [1, 2, 3, 3, 4, 6]

      expect(merged_list.to_a).to eq expected_result
    end
  end
end
