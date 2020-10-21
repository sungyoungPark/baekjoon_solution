import java.util.*;
import java.io.* ;

public class Main{

    public static void main(String args[]) throws IOException
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        int[] arr = new int[1001];
        int max = 0;
        for(int i=0;i<n;i++){
            String[] str = br.readLine().split(" ");
            int day = Integer.parseInt(str[0]);
            int cost = Integer.parseInt(str[1]);
            if(max < day){
                max = day;
            }
            while (true){
                if(cost == 0 || day == 0){
                    break;
                }
                if(arr[day] < cost){
                    int temp = arr[day];
                    arr[day] = cost;
                    cost = temp;
                }
                day--;
            }


        }

        int res = 0;
        for(int i=1;i<=max;i++){
            res = res + arr[i];
        }
        System.out.println(res);
    }
    /////
}
