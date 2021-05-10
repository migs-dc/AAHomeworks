class GraphNode

    attr_reader :value
    attr_accessor :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end

end

def bfs(starting_node, target_value) #bfs(target_value)
    queue = [ starting_node ]
    until queue.empty?
        node = queue.shift
        return node if target_value == node.value
        node.neighbors.each { |neighbor| queue << neighbor }
    end
    nil
end

def bfs_with_set(starting_node, target_value) #bfs(target_value)
    # checked = Set[ starting_node.value ] # i'll review this and ask a question in class maybe
    checked = []
    queue = [ starting_node ]
    until queue.empty?
        node = queue.shift
        return node if target_value == node.value
        node.neighbors.each do |neighbor| 
            queue << neighbor if !checked.include?(neighbor.value)
            checked << neighbor.value
        end
    end
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a,'d')
# p bfs(a,'f') # infinite loop
p bfs_with_set(a,'f')
p bfs_with_set(a,'z')