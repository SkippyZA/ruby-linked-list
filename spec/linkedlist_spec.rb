require "linkedlist"

RSpec.describe LinkedList do

  context "#append" do
    it "adds to the end of the list" do
      list = LinkedList.new
      list.append 1
      list.append 2
      list.append 3

      expect(list.asArray).to eq [1, 2, 3]
    end
  end

  context "#insertAt" do
    it "should insert in the middle of the list" do
      list = LinkedList.new
      list.append 1
      list.append 2
      list.append 3

      list.insertAt(2, 10)

      expect(list.asArray).to eq [1, 2, 10, 3]
    end

    it "should insert at the head of the list when adding at position 0" do
      list = LinkedList.new
      list.append 1
      list.append 2

      list.insertAt(0, 10)

      expect(list.asArray).to eq [10, 1, 2]
    end

    it "should insert at the end of the list" do
      list = LinkedList.new
      list.append 1
      list.append 2

      list.insertAt(2, 10)

      expect(list.asArray).to eq [1, 2, 10]
    end

    it "should insert at the head as the only value" do
      list = LinkedList.new

      list.insertAt(0, 10)

      expect(list.asArray).to eq [10]
    end
  end

  context "#deleteAt" do
    it "should remove the head of the list" do
      list = LinkedList.new
      list.append 1
      list.append 2
      list.append 3

      list.deleteAt 0

      expect(list.asArray).to eq [2, 3]
    end

    it "should delete data in the middle of the list" do
      list = LinkedList.new
      list.append 1
      list.append 2
      list.append 3

      list.deleteAt 1

      expect(list.asArray).to eq [1, 3]
    end

    it "should remove the last value of the list" do
      list = LinkedList.new
      list.append 1
      list.append 2
      list.append 3

      list.deleteAt 2

      expect(list.asArray).to eq [1, 2]
    end
  end

  context "#reverse" do
    it "should return a reversed linked list" do
      list = LinkedList.new
      list.append 1
      list.append 2
      list.append 3

      expect(list.reverse.asArray).to eq [3, 2, 1]
      expect(list.asArray).to eq [1, 2, 3]
    end
  end

  context "#reverse!" do
    it "should reverse the order of the linked list" do
      list = LinkedList.new
      list.append 1
      list.append 2
      list.append 3
      list.append 4
      list.append 5
      list.append 6

      list.reverse!

      expect(list.asArray).to eq [6, 5, 4, 3, 2, 1]
    end
  end
end
