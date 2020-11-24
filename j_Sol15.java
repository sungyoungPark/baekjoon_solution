import java.util.*;
import java.io.* ;
public class Main{
    static int n = 0;
    static int m = 0;
    static int h = 0;

    static int res = 0;
    static int tom = 0;

    static ArrayList<int[][]> box = new ArrayList<>();
    static ArrayList<boolean[][]> visit = new ArrayList<>();
    static LinkedList<int[]> queue = new LinkedList<>();

    static int[] dx = {-1,1,0,0};
    static int[] dy = {0,0,1,-1};
    static int[] dz = {1,-1};

    public static void bfs(){
        int day = 0;
        while (!queue.isEmpty()){
            int[] ft = queue.poll(); //x,y,칸,날짜
            int x = ft[0];
            int y = ft[1];
            int z = ft[2];
            int cost = ft[3];

            for(int i=0;i<2;i++){  //상하
                int nz = z + dz[i];
                if(nz >=0 && nz <h && visit.get(nz)[x][y] == false && box.get(nz)[x][y] == 0){
                    visit.get(nz)[x][y] = true;
                    box.get(nz)[x][y] = 1;
                    int[] ad = {x,y,nz,cost+1};
                    queue.add(ad);
                    tom--;
                }
            }


            for(int i =0;i<4;i++){
                int nx = x + dx[i];
                int ny = y + dy[i];
                if(nx>=0 && nx < n && ny>=0 && ny<m && visit.get(z)[nx][ny] ==false && box.get(z)[nx][ny] == 0){
                    visit.get(z)[nx][ny] = true;
                    box.get(z)[nx][ny] = 1;
                    int[] ad = {nx,ny,z,cost+1};
                    queue.add(ad);
                    tom--;
                }
            }

            if(day<cost){
                day = cost;
            }
        }
        if(tom != 0){
            res = -1;
        }
        else{
             res = day;
        }
        //System.out.println(tom);
        //System.out.print(day);
    }


    public static void main(String args[]) throws IOException
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        m = Integer.parseInt(st.nextToken());
        n = Integer.parseInt(st.nextToken());
        h = Integer.parseInt(st.nextToken());

        for (int i=0;i<h;i++){
            int[][] arr = new int[n][m];
            boolean[][] vi = new boolean[n][m];
            for(int x=0;x<n;x++){
                String[] str = br.readLine().split(" ");
                for(int y=0;y<m;y++){
                    arr[x][y] = Integer.parseInt(str[y]);
                    if (arr[x][y] == 1){
                        int[] ad = {x,y,i,0};  //x,y,칸,날짜
                        queue.add(ad);
                    }
                    if (arr[x][y] == 0){
                        tom ++;
                    }
                }
            }
            box.add(arr);
            visit.add(vi);
        }

        bfs();
        System.out.print(res);
    }
}
