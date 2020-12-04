class CircularQueue
  def initialize(buffer)
    @buffer = buffer
    @current_idx = 0
    @oldest_idx = 0
    @queue = Array.new(buffer)
  end

  def enqueue(num)
    @oldest_idx = increment_idx(@oldest_idx) if @queue[@current_idx] != nil
    @queue[@current_idx] = num
    @current_idx = increment_idx(@current_idx)
  end

  def dequeue
    return nil if @queue.all?(&:nil?)
    value = @queue[@oldest_idx]
    @queue[@oldest_idx] = nil
    @oldest_idx = increment_idx(@oldest_idx)
    value
  end
  
  private

  def increment_idx(idx)
    if (idx + 1) > (@buffer - 1)
      idx = 0
    else
      idx += 1
    end 
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5

puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil