import java.util.*;
import java.io.* ;

public class Main{

    static int[][] arr = new int[1][1];

    public static int bfs(int x, int y,int size){
        LinkedList<int[]> quee = new LinkedList<>();
        int[] ft = {x,y,0};
        quee.add(ft);
        int[][] visit = new int[size][size];

        for(int i=0;i<size;i++){
            for(int j=0;j<size;j++){
                visit[i][j] = Integer.MAX_VALUE;
            }
        }
        visit[x][y] = 0;

        int[] dx = {-1,1,0,0}; //좌,우,위,아래
        int[] dy = {0,0,-1,1};

        while (quee.size() > 0){
            int[] first = quee.poll();
            int x1 = first[0];
            int y1 = first[1];
            int cost = first[2];

            for(int i=0;i<4;i++){
                int nx = x1 + dx[i];
                int ny = y1 + dy[i];

                if(nx >=0 && nx<size && ny>=0 && ny < size){
                    if(arr[nx][ny] == 0){  //검은 방이면
                        if(visit[nx][ny] > cost+1){
                            visit[nx][ny] = cost+1;
                            int[] ad = {nx,ny,cost+1};
                            quee.add(ad);
                        }
                    }
                    else{ //하얀방
                        if(visit[nx][ny] > cost){
                            visit[nx][ny] = cost;
                            int[] ad = {nx,ny,cost};
                            quee.add(ad);
                        }
                    }
                }


            }



        }




        return visit[size-1][size-1];
    }


    public static void main(String args[]) throws IOException
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int size = Integer.parseInt(br.readLine());
        arr = new int[size][size];

        for(int i=0;i<size;i++){
            String str = br.readLine();
            for(int j=0;j<size;j++){
                arr[i][j] = str.charAt(j) - '0';
            }

        }

        System.out.println(bfs(0,0,size));

    }
    /////
}
