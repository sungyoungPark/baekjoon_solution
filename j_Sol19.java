import java.util.*;
import java.io.* ;

public class Main{

    public static StringBuilder sb = new StringBuilder();  //시간 초과를 피하기 위해... 출력을 한번에 해줌

    public static void main(String args[]) throws IOException
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int testCase = Integer.parseInt(st.nextToken());


        for(int j=0;j<testCase;j++){
            //int[] arr = new int[16];
            String str = br.readLine();
            int total = 0;
            for(int i=0;i<16;i++){
                if(i%2 == 0){
                    int n = Character.getNumericValue(str.charAt(i)) * 2;
                    if(n>=10){
                        //arr[i] = (n/10) + (n%10);
                        total = total + (n/10) + (n%10);
                    }
                    else{
                        //arr[i] = n;
                        total = total + n;
                    }
                }
                else {
                    //arr[i] = Character.getNumericValue(str.charAt(i));
                    total = total + Character.getNumericValue(str.charAt(i));
                }
            }
            if(total%10 == 0){
                sb.append("T\n");
            }
            else{
                sb.append("F\n");
            }

        }

        System.out.println(sb);


    }
}
