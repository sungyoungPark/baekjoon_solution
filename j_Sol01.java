import java.util.*;
import java.io.* ;


public class Main{
    static int count = 0;
    static boolean[][] visit = new boolean[1][2];
    static int[][] arr = new int[1][2];

    public static void bfs(int x, int y,int max_x,int max_y){
        LinkedList<int[]> quee = new LinkedList<>();
        int[] ft = {x,y};
        quee.add(ft);
        visit[y][x] = true;

        while (quee.size() > 0){
            int[] first = quee.poll();

            int x1 = first[0];
            int y1 = first[1];

            if(x1+1 < max_x) {
                if (arr[y1][x1+1] == 1 && visit[y1][x1+1] == false ) {
                    int[] add = {x1 + 1, y1};
                    visit[y1][x1+1] = true;
                    quee.add(add);
                }
            }
            if(y1+1 < max_y) {
                if (arr[y1+1][x1] == 1 && visit[y1+1][x1] == false) {
                    int[] add = {x1, y1 + 1};
                    visit[y1+1][x1] = true;
                    quee.add(add);
                }
            }

            if(x1-1 >=0){
                if (arr[y1][x1-1] == 1 && visit[y1][x1-1] == false) {
                    int[] add = {x1-1, y1};
                    visit[y1][x1-1] = true;
                    quee.add(add);
                }
            }
            if(y1-1 >=0){
                if (arr[y1-1][x1] == 1 && visit[y1-1][x1] == false) {
                    int[] add = {x1, y1 - 1};
                    visit[y1-1][x1] = true;
                    quee.add(add);
                }
            }

        }


    }


    public static void main(String args[]) throws IOException
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());
        int[] res = new int[T];
        for(int i=0;i<T;i++){
            String[] str = br.readLine().split(" ");

            int M = Integer.parseInt(str[0]);
            int N = Integer.parseInt(str[1]);
            int K = Integer.parseInt(str[2]);

            arr = new int[N][M];
            visit = new boolean[N][M];

            for(int j=0;j<K;j++){
                String[] str1 = br.readLine().split(" ");
                int x = Integer.parseInt(str1[0]);
                int y = Integer.parseInt(str1[1]);
                arr[y][x] = 1;
            }

            /*
            for(int a = 0;a<M;a++){
                for(int b = 0;b<N;b++){
                    System.out.print(arr[a][b]+ " ");
                }
                System.out.println();
            }
            */


            for(int y = 0;y<N;y++){  //y
                for(int x = 0;x<M;x++){ //x
                    if(visit[y][x] == false && arr[y][x] == 1){
                        bfs(x,y,M,N);
                        count++;
                    }
                }
            }
            res[i] = count;
            count = 0;
        }

        for(int i=0;i<T;i++){
            System.out.println(res[i]);
        }

    }
}
