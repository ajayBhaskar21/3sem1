// Using Priority Queue
import java.util.ArrayList;
import java.util.PriorityQueue;

class Node implements Comparable<Node> {
    int place;
    int cost;
    Node(int place, int cost) {
        this.place = place;
        this.cost = cost;
    }
    @Override
    public int compareTo(Node other) {
        // compare nodes based on cost
        return Integer.compare(this.cost, other.cost);
    }
}

public class third {
    static boolean isPresent(PriorityQueue<Node> priorityQueue, int checkPlace) {
        PriorityQueue<Node> temp = new PriorityQueue<>(priorityQueue);
        while (!temp.isEmpty()) {
            Node t = temp.poll();
            if (t.place == checkPlace) {
                return true;
            }
        }
        return false;
    } 
    static void deleteOldPlace(PriorityQueue<Node> priorityQueue, int oldPlace) {
        int size = priorityQueue.size();
        while (size-- > 0) {
            Node temp = priorityQueue.poll();
            int Place = temp.place;
            if (Place != oldPlace) {
                priorityQueue.offer(temp);
            }
        }
    }
    public static void main(String[] args) {
        int[][] graph = {
            { 999, 5, 1, 999, 999 },
            { 5, 999, 5, 4, 999 },
            { 1, 5, 999, 7, 10 },
            { 999, 4, 7, 999, 3 },
            { 999, 999, 10, 3, 999 }
        };
        int start = 0;
        int goal = 4;
        int cost = 0;
        String[] cities = { "Miami", "Tatooine", "Rivendell", "Hogwarts", "Orlando" };
        PriorityQueue<Node> priorityQueue = new PriorityQueue<>();
        ArrayList<Integer> visited = new ArrayList<>();
        priorityQueue.add(new Node(start, 0));
        // Until goal state is visited.
        while (!visited.contains(goal)) {
            Node temp = priorityQueue.poll();
            // Add child's 
            int traverse = temp.place;
            cost += temp.cost;
            visited.add(traverse);
            for (int j = 0; j < graph.length; j++) {
                if (graph[traverse][j] != 999) {
                    // If it is not visited
                    if (!visited.contains(j)) {
                        // If place is present then delete it in priorityqueue.
                        if (isPresent(priorityQueue, j)) {
                            deleteOldPlace(priorityQueue, j);
                        }
                        priorityQueue.add(new Node(j, graph[traverse][j]));
                    }
                }
            }
        }
        System.out.print("Path in UCS : ");
        for (Integer i : visited) {
            System.out.print(cities[i] + " -> ");
        }
        System.out.println("\nUCS cost = " + cost);
    }
}