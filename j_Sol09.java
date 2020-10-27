import java.util.*;
import java.io.* ;
public class Main{
    static List<Node>[] list;
    static int n;
    static int k;
    static PriorityQueue<Integer>[] dis;

    static class Node implements Comparable<Node> {
        int v, weight;

        public Node(int v, int weight){
            this.v = v;
            this.weight = weight;
        }

        @Override
        public int compareTo(Node o) {
            return this.weight - o.weight;
        }
    }

    static PriorityQueue[] bfs(){  //무조건 1에서 출발
        dis = new PriorityQueue[n+1];
        for(int i=1;i<n+1;i++){
            dis[i] = new PriorityQueue<>(Collections.reverseOrder());
        }
        dis[1].add(0);
        PriorityQueue<Node> quee = new PriorityQueue<>();
        quee.add(new Node(1,0));
        boolean[][] visit = new boolean[n+1][n+1];

        while (quee.size() > 0 ){
            Node first = quee.poll();
            int x1 = first.v;
            int cost = first.weight;

            for(Node next : list[x1]){

                    if(dis[next.v].size() < k){
                        dis[next.v].add(cost + next.weight);
                        quee.add(new Node(next.v,cost + next.weight));
                    }
                    else if(dis[next.v].peek() > cost + next.weight){
                       dis[next.v].poll();
                       dis[next.v].add(cost + next.weight);
                       quee.add(new Node(next.v,cost + next.weight));
                    }
                 
                }


        }

        return dis;
    }

    public static void main(String args[]) throws IOException
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());
        k = Integer.parseInt(st.nextToken());

        list = new ArrayList[n+1];

        for(int i=1;i<=n;i++){
            list[i] = new ArrayList<>();
        }

        for(int i=0;i<m;i++){
            st = new StringTokenizer(br.readLine());
            int a = Integer.parseInt(st.nextToken());
            int b = Integer.parseInt(st.nextToken());
            int c = Integer.parseInt(st.nextToken());
            list[a].add(new Node(b,c));
        }

        PriorityQueue<Integer>[] dis = bfs();
        for(int i=1;i<n+1;i++){
            if(dis[i].size() < k){
                System.out.println(-1);
            }
            else{
                System.out.println(dis[i].peek());
            }
        }


    }
}
