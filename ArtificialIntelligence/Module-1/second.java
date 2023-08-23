import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Collections;
import java.util.Comparator;

class Node {
    int place;
    int cost;
    Node(int place, int cost) {
        this.place = place;
        this.cost = cost;
    }
    Node() {}
}

class CostComparator implements Comparator<Node> {
    @Override
    public int compare(Node node1, Node node2) {
        return Integer.compare(node1.cost, node2.cost);
    }
}

class second {

    static boolean isPresent(Queue<Node> queue, int checkPlace) {
        Queue<Node> temp = new LinkedList<>(queue);
        while (!temp.isEmpty()) {
            Node t = temp.poll();
            if (t.place == checkPlace) {
                return true;
            }
        }
        return false;
    } 

    static void deleteOldPlace(Queue<Node> queue, int oldPlace) {
        int size = queue.size();
        while (size -- > 0) {
            Node temp = queue.poll();
            int Place = temp.place;
            if (Place != oldPlace) {
                queue.offer(temp);
            }
        }
    }

    static void sort(Queue<Node> queue) {
        ArrayList<Node> nodes = new ArrayList<>();
        int size = queue.size();
        while (!queue.isEmpty()) {
            Node temp = queue.poll();
            nodes.add(temp);
        }
        // sort the ArrayList
        Collections.sort(nodes, new CostComparator());
        for (int i = 0; i < nodes.size(); i++) {
            queue.offer(nodes.get(i));
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
        String[] cities = { "Orlando", "Hogwarts", "Rivendell", "Tatooine", "Miami" };
        Queue<Node> queue = new LinkedList<>();
        ArrayList<Integer> visited = new ArrayList<>();
        queue.add(new Node(start, 0));
        while (!visited.contains(goal)) {
            Node temp = queue.poll();
            // Add child's of the current place
            int traverse = temp.place;
            cost += temp.cost;
            visited.add(traverse);
            for (int j = 0; j < graph.length; j ++) {
                if (graph[traverse][j] != 999) {
                    // If it is not visited
                    if (!visited.contains(j)) {
                        // If place is present then delete it in queue. 
                        if (isPresent(queue, j)) {
                            deleteOldPlace(queue, j);
                        }
                        queue.add(new Node(j, graph[traverse][j])); 
                    }
                }
            }
            // Sort data in queue based on the cost
            sort(queue);
        }
        System.out.print("Path in UCS : ");
        for (Integer i : visited) {
            System.out.print(cities[i] + " -> ");
        }
        System.out.println("\nUCS cost = " + cost);
    }
}