import java.util.*;
import java.io.* ;

public class Main{

    static int[][] arr = new int[1][1];
    static boolean[][] visit = new boolean[1][1];
    static int size = 0;
    static int[] dx = {-1,1,0,0};
    static int[] dy = {0,0,-1,1};

    static int dfs(int x, int y, int target){
        if(arr[x][y] <= target){
            return -1;
        }

        visit[x][y] = true;

        for(int i=0;i<4;i++){
            int nx = x +dx[i];
            int ny = y +dy[i];

            if(nx >=0 && nx < size && ny>=0 && ny < size){
                if(visit[nx][ny] == false){
                    dfs(nx,ny,target);
                }
            }

        }




        return 0;
    }


    public static void main(String args[]) throws IOException
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        size = Integer.parseInt(br.readLine());

        arr = new int[size][size];
        int max = 0;
        for(int i=0;i<size;i++){
            String[] str = br.readLine().split(" ");
            for(int j=0;j<size;j++){
                arr[i][j] = Integer.parseInt(str[j]);
                if(max < arr[i][j]){
                    max = arr[i][j];
                }
            }
        }

        int res = 0;

        for(int i=0;i<max;i++){
            visit = new boolean[size][size];
            int count =0;
            for(int x=0;x<size;x++){
                for(int y=0;y<size;y++){
                    if(visit[x][y] == false){
                        if(dfs(x,y,i)!=-1){
                            count++;
                        }
                    }
                }
            }
/*
            System.out.print(i+" / "+count);
            System.out.println();
            for(int x=0;x<size;x++){
                for(int y=0;y<size;y++){
                   System.out.print(visit[x][y]+" ");
                }
                System.out.println();
            }

*/
            if(count > res){
                res = count;
            }

        }
        System.out.println(res);

    }
    /////
}
