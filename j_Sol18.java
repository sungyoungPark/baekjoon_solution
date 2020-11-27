import java.util.*;
import java.io.* ;
public class Main{
    public static void main(String args[]) throws IOException
	{
  
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        int n = Integer.parseInt(st.nextToken());
        int k = Integer.parseInt(st.nextToken());

        int[][] arr = new int[n+1][k+1];

        for(int i=1;i<n+1;i++) {
            st = new StringTokenizer(br.readLine());
            int a = Integer.parseInt(st.nextToken());
            int b = Integer.parseInt(st.nextToken());

            for(int j=1;j<k+1;j++){
                if(j <a){
                    arr[i][j]= arr[i-1][j];
                }
                else{
                    arr[i][j] = Math.max(arr[i-1][j],arr[i-1][j-a]+b);
                }

            }


        }
        /*
        for(int i=0;i<n+1;i++){
            for(int j=0;j<k+1;j++){
                System.out.print(arr[i][j]+"  ");
            }
            System.out.println();
        }
        */
        System.out.println(arr[n][k]);
          }
}
