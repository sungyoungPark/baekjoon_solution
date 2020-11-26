import java.util.*;
import java.io.* ;
public class Main{
    static int n = 0;
    static int m = 0;
    public static StringBuilder sb = new StringBuilder();  //시간 초과를 피하기 위해... 출력을 한번에 해줌

    static boolean[] visit = new boolean[0];

    public static void dfs(int count,int start ,int[] arr){
        if(count == 0){
            for(int i=0;i<m;i++){
                sb.append(arr[i] + " ");
            }
            sb.append("\n");
            return;
        }

        for(int i=1;i<=n;i++){
            if(visit[i] ==  false){
                visit[i] =  true;
                arr[m-count] = i;
                dfs(count-1,i+1,arr);
                visit[i] = false;
            }
        }

    }

    public static void main(String args[]) throws IOException
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        StringTokenizer st = new StringTokenizer(br.readLine());

        n = Integer.parseInt(st.nextToken());
        m = Integer.parseInt(st.nextToken());

        int[] arr = new int[m];
        visit = new boolean[n+1];

        dfs(m,1,arr);
        System.out.print(sb);
    }
}
