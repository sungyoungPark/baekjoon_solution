import java.util.*;
import java.io.* ;

//union-Find 알고리즘 이용!!!

public class Main{

    static int[] parent;
    static boolean[] visit;
    static StringBuilder sb = new StringBuilder();  //이 방벙을 사용하지 않고 출력시 시간 초과 오류 있음.

    static int find(int x){
        if(x==parent[x])
            return x;
        else
            return parent[x] = find(parent[x]);
    }

    static void union(int x,int y){
        x = find(x);
        y = find(y);
        parent[x] = y;
        sb.append("LADICA\n");
    }

    public static void main(String args[]) throws IOException
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] str = br.readLine().split(" ");

        int n = Integer.parseInt(str[0]);
        int l = Integer.parseInt(str[1]);

        parent = new int[l+1];

        for(int i=0;i<=l;i++){
            parent[i] = i;
        }

        visit = new boolean[l+1];

        for(int i=1;i<=n;i++){
            String[] str1 = br.readLine().split(" ");
            int a = Integer.parseInt(str1[0]);
            int b = Integer.parseInt(str1[1]);
            if(visit[a] == false){
                visit[a] = true;
                union(a,b);
            }
            else if(visit[b] == false){
                visit[b] = true;
                union(b,a);
            }
            else if(visit[find(a)] == false){
                visit[find(a)] = true;
                union(a,b);
            }
            else if(visit[find(b)] == false){
                visit[find(b)] = true;
                union(b,a);
            }
            else{
                sb.append("SMECE\n");
            }
        }

        System.out.println(sb.toString());



    }
    /////
}
