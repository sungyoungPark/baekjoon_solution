import java.util.*;
import java.io.* ;

public class Main{

    public static void main(String args[]) throws IOException
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int G = Integer.parseInt(br.readLine());
        int P = Integer.parseInt(br.readLine());

        boolean[] visit = new boolean[G+1];
        boolean flag = false;
        for(int i=1;i<=P;i++){
            int k = Integer.parseInt(br.readLine());
            if(k>G){
                System.out.println(i-1);
                break;
            }
            while (true){
                if(k == 0){
                    flag = true;
                    break;
                }
                if(visit[k]==false){
                    visit[k] = true;
                    break;
                }
                k--;
            }
            if(flag == true){
                System.out.println(i-1);
                break;
            }
        }
        if(flag == false){
            System.out.println(P);
        }
    }
    /////
}
