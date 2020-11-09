import java.util.*;
import java.io.* ;
public class Main{

    public static void main(String args[]) throws IOException
    {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int t = Integer.parseInt(br.readLine());

        for(int i=0; i<t ;i++){
            StringTokenizer st = new StringTokenizer(br.readLine());
            String target = st.nextToken();
            if(target.length() == 7){
                if(target.charAt(0) == target.charAt(1) && target.charAt(4) == target.charAt(1) && target.charAt(2) != target.charAt(1)){
                    if(target.charAt(2) == target.charAt(3) && target.charAt(5) == target.charAt(6) && target.charAt(3) == target.charAt(5)){
                        System.out.println(1);
                    }
                }
                else {
                    System.out.println(0);
                }
            }
            else {
                System.out.println(0);
            }
        }

    }
}
