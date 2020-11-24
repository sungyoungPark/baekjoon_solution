import java.util.*;
import java.io.* ;
public class Main{
    static ArrayList<Integer> res = new ArrayList<>();
    static boolean[][] visit = new boolean[0][0];
    static int[][] arr = new int[0][0];
    static int n = 0;

    static int[] dx = {-1,1,0,0};
    static int[] dy = {0,0,1,-1};

    static void bfs(int x, int y, int roomNO){
        int[] input = {x,y};
        LinkedList<int[]> queue = new LinkedList<>();
        queue.add(input);
        int count = 0;

        while (!queue.isEmpty()){
            int[] ft = queue.poll();
            count++;
            for(int i =0 ;i<4;i++){
                int nx = ft[0] + dx[i];
                int ny = ft[1] + dy[i];
                if(nx>=0 && nx < n && ny>=0 && ny<n){
                    if(visit[nx][ny] == false && arr[nx][ny] == roomNO){
                        visit[nx][ny] = true;
                        int[] ad = {nx,ny};
                        queue.add(ad);
                    }
                }
            }
        }

        res.add(count);
    }

    public static void main(String args[]) throws IOException
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        n = Integer.parseInt(st.nextToken());
        arr = new int[n][n];
        visit = new boolean[n][n];

        for(int i=0;i<n;i++){
            st = new StringTokenizer(br.readLine());
            String str = st.nextToken();
            for(int j=0;j<n;j++){
                arr[i][j] = str.charAt(j) -'0';
            }
        }

        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++){
                if(arr[i][j] != 0 && visit[i][j] == false){
                    visit[i][j] = true;
                    bfs(i,j,arr[i][j]);
                }
            }
        }

        Collections.sort(res);
        System.out.println(res.size());
        for(int i=0;i<res.size();i++)
            System.out.println(res.get(i));
    }
}
