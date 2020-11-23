import java.util.*;
import java.io.* ;
public class Main{
/*
1.벽을 세운다
2.바이러스를 퍼트린다
3.안전구역 갯수를 센다

 */
    static int n = 0;
    static int m = 0;
    public static StringBuilder sb = new StringBuilder();
    static int[][] arr = new int[0][0];
    static int res = 0; //안전구역에 최대값
    static LinkedList<int[]> queue = new LinkedList<>();
    static int blockCount = 0;

    public static void buildBlock(int[][] room, int count){  //벽세우기
        if(count == 0){
            // bfs 진행
            bfs(room);
            return;
        }
        int[][] copy = room;
        for(int i=0;i<n;i++){
            for(int j=0;j<m;j++){
                if(copy[i][j] == 0){
                    copy[i][j] = 1;
                    buildBlock(copy,count-1);
                    copy[i][j] = 0;
                }
            }
        }



    }

    static int[] dx = {0,0,1,-1};
    static int[] dy = {1,-1,0,0};

    public static void bfs(int[][] room){ //바이러스 뿌리고 안전구역 계산
        boolean[][] visit = new boolean[n][m];
        LinkedList<int[]> copy = new LinkedList<>();
        copy = (LinkedList)queue.clone();

        int infection = 0;

        while (!copy.isEmpty()){
            int[] ft = copy.poll();
            int x = ft[0];
            int y = ft[1];
            infection ++;

            for(int i=0;i<4;i++) {
                int nx = x + dx[i];
                int ny = y + dy[i];

                if (nx >= 0 && nx < n && ny >= 0 && ny < m) {
                    if (room[nx][ny] == 0 && visit[nx][ny] == false) {
                        visit[nx][ny] = true;
                        int[] ad = {nx, ny};
                        copy.add(ad);
                    }

                }
            }

        }

        if(res < (n*m) - (blockCount + infection)){
            res = (n*m) - (blockCount + infection);
        }
    }


    public static void main(String args[]) throws IOException
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        n = Integer.parseInt(st.nextToken());
        m = Integer.parseInt(st.nextToken());

        arr = new int[n][m];

        for(int i=0;i<n;i++){
            st = new StringTokenizer(br.readLine());
            for(int j=0;j<m;j++){
                arr[i][j] = Integer.parseInt(st.nextToken());
                if(arr[i][j] == 2){
                    int[] ad = {i,j};
                    queue.add(ad);
                }
                if(arr[i][j] == 1){
                   blockCount ++;
                }
            }
        }

        buildBlock(arr,3);

        System.out.print(res-3);  //추가된 블럭 갯수 3개 빼주기
    }
}
