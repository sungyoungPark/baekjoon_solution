import java.util.*;

public class Main {
    static  int answer = 0;
   public static void main(String[] args){
       Scanner scanner = new Scanner(System.in);
        int i = scanner.nextInt();
        int[] T = new int[i];
        for(int k = 0 ; k< i ; k ++){
          //  System.out.println("값 입력");
            T[k] = scanner.nextInt();
        }
        for(int j = 0 ; j<i ; j++){

            //중복순열 (순서있게 배열 + 자시자신도 포함)
            LinkedList<Integer> rePerArr = new LinkedList<Integer>();
            int count = 0;
            rePermutation(4, T[j], rePerArr,count);
            System.out.println(answer);
            answer = 0;
        }
    }



    private static void rePermutation(int n, int r, LinkedList<Integer> rePerArr, int count) {
        if(count == r && rePerArr.size() <= r){
           // System.out.print(count + " ");
             //   for (int i : rePerArr) {
             //       System.out.print(i + " ");
              //  }
              //  System.out.println("끝");
                answer ++;
            return;
        }
        else if (count >r){
           // System.out.println("초과" + count);
            return;
        }
            for (int i = 1; i < n; i++) {
                    count = count + i;
                    rePerArr.add(i);
                    rePermutation(n, r, rePerArr,count);
                    count = count - rePerArr.getLast();
                    rePerArr.removeLast();
            }
    }

}
