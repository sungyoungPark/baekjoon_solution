import java.util.*;
import java.io.* ;
public class Main{

    static int[] par;
    static int[] cost;

    public static void union(int a, int b) {
        int p = find(a);
        int q = find(b);

        if (p == q)
            return;
        if(cost[p] < cost[q]) par[q] = p;
        else{
            par[p] = q;
        }

    }

    public static int find(int n) {
        if (par[n] == n)
            return n;
        return par[n] = find(par[n]);
    }


    public static void main(String args[]) throws IOException
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        String[] str = br.readLine().split(" ");
        int n = Integer.parseInt(str[0]);
        int m = Integer.parseInt(str[1]);
        int k = Integer.parseInt(str[2]);  //가지고 있는 돈

        cost = new int[n+1];
        int[][] graph = new int[n+1][n+1];
        par = new int[n+1];

        StringTokenizer st = new StringTokenizer(br.readLine());

        for(int i=1;i<=n;i++){
            cost[i] = Integer.parseInt(st.nextToken());
        }

        for(int i=1;i<=n;i++){ //초기화
            par[i] = i;
        }

        for(int i=0;i<m;i++){
            st = new StringTokenizer(br.readLine());

            int a = Integer.parseInt(st.nextToken());
            int b = Integer.parseInt(st.nextToken());
            if(find(a) != find(b)){
                union(find(a),find(b));
            }

        }

       int ans = 0;
       for(int i=1;i<=n;i++){
           if(find(i) != 0){
               ans += cost[find(i)];
               union(0,find(i));
           }
       }

       if(ans <= k){
           System.out.println(ans);
       }
       else {
           System.out.println("Oh no");
       }

    }
}
