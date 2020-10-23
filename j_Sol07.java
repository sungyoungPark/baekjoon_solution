import java.util.*;
import java.io.* ;

public class Main{

    public static boolean isPrime3(int num) {
        boolean result = true;
        int end = (int)Math.sqrt(num);
        for(int i = 2; i <= end; i++) {
            if( num%i == 0) {
                result = false;
                break;
                //나누어 떨어지면 더이상 소수가 아니므로 break를 걸어 for문을 끝낸다.
            } else {
                result = true;
            }
        }
        return result;
    }

    static void dfs(int n,String num){
        if(num.length() ==n){
            if(isPrime3(Integer.parseInt(num))){
                System.out.println(num);
            }
            return;
        }
        int cur = Integer.parseInt(num)*10;
        for (int i=1;i<=9;i++){
            if(isPrime3(cur+i)){
                //System.out.println(cur+i);
                dfs(n,Integer.toString(cur+i));
            }
        }


    }



    public static void main(String args[]) throws IOException
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(br.readLine());
        for(int i=2;i<=9;i++){
            if(isPrime3(i)){
                dfs(n,Integer.toString(i));
            }
        }

    }
    /////
}
