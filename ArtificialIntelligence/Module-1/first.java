import java.util.ArrayList;
class first {
    public static void main(String[] args) {
        int[][] graph = {
            {999, 3, 10, 999, 999},
            {3, 999, 7, 4, 999},
            {10, 7, 999, 5, 1},
            {999, 4, 5, 999, 5},
            {999, 999, 1, 5, 999}
        };
        String[] cities = {"Orlando", "Hogwarts", "Rivendell", "Tatooine", "Miami"};
        ArrayList<Integer> visited = new ArrayList<>();
        int start = 4;
        int cost = 0;
        visited.add(start);
        while (!visited.contains(0)) {
            int min = Integer.MAX_VALUE;
            for(int i = 0; i < graph.length; i++)
                if (min > graph[start][i]) 
                    min = graph[start][i];
            int j;
            for (j = 0; j < graph.length; j ++)
                if (min == graph[start][j])
                    break;
            if (visited.contains(j)) 
                graph[start][j] = 999;
            else{
                visited.add(j);
                start = j;
                cost += min;
            }   
        }
        System.out.print("Path in UCS : ");
        for (Integer i : visited) {
            System.out.print(cities[i] + " -> ");
        }
        System.out.println("\nCost in UCS = " + cost);
    }
}