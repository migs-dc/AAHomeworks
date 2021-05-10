#Exercise 1 - Stack

class Stack
  def initialize
    # create ivar to store stack here!
    @stack = []
  end

  def push(el)
    # adds an element to the stack
    stack.push(el)
  end

  def pop
    # removes one element from the stack
    stack.pop
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    stack[-1]
  end

  def print
    #prints the stack
    # p @stack.join(" ")
    p stack
  end

  def length 
    stack.length
  end

  private #doesn't allow what's below to be accessed outside the method
  attr_reader :stack
end

stack = Stack.new
p stack.peek
stack.print
("a".."z").each{|el| p stack.push(el)}
stack.length.times do 
  stack.pop
  stack.print
end


