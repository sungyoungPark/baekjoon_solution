import java.util.*;
import java.io.* ;
public class Main{

    static int n = 0;
    static ArrayList<hack>[] graph;

    public static StringBuilder sb = new StringBuilder();  //시간 초과를 피하기 위해... 출력을 한번에 해줌

    public static class hack{
        int end;
        int cost;

        hack(int end, int cost){
            this.end = end;
            this.cost = cost;
        }
    }


    public static void dijkstra(int v){
        LinkedList<hack> queue = new LinkedList<>();
        int[] visit = new int[n+1];
        for(int i=1;i<=n;i++){
            visit[i] = Integer.MAX_VALUE;
        }
        visit[v] = 0;

        for(int i=0;i<graph[v].size();i++){
            queue.add(graph[v].get(i));
            visit[graph[v].get(i).end] = graph[v].get(i).cost;
        }


        while (!queue.isEmpty()){
            hack ft = queue.poll();
            int ends =ft.end;
            int costs = ft.cost;

            for(int i=0;i<graph[ends].size();i++){
                if(visit[graph[ends].get(i).end] > costs + graph[ends].get(i).cost){
                    visit[graph[ends].get(i).end] = costs + graph[ft.end].get(i).cost;
                    queue.add(new hack(graph[ends].get(i).end,costs + graph[ft.end].get(i).cost));
                }


            }

        }

        int count = 0;
        int max_res = 0;

        for(int i=1;i<=n;i++){
            if(visit[i] != Integer.MAX_VALUE){
                count ++;
                if(visit[i] > max_res){
                    max_res = visit[i];
                }
            }
        }

       sb.append(count+" "+max_res+"\n");
    }



    public static void main(String args[]) throws IOException
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        // StringTokenizer st = new StringTokenizer(br.readLine());
        int testCase = Integer.parseInt(br.readLine());

        for(int i=0;i<testCase;i++){
            StringTokenizer st = new StringTokenizer(br.readLine());
            n = Integer.parseInt(st.nextToken());
            int d = Integer.parseInt(st.nextToken());
            int c = Integer.parseInt(st.nextToken());

            graph = new ArrayList[n+1];

            for(int j=1;j<=n;j++)
                graph[j] = new ArrayList<>();

            for(int j=0;j<d;j++){
                st = new StringTokenizer(br.readLine());
                int a = Integer.parseInt(st.nextToken());
                int b = Integer.parseInt(st.nextToken());
                int cost = Integer.parseInt(st.nextToken());

                graph[b].add(new hack(a,cost));
            }
            dijkstra(c);
        }
        System.out.println(sb);

    }
}
