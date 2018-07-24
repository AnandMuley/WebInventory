package demo.thread;

/**
 * Created by cts1 on 22/3/17.
 */
 public class CalculatorImplementRunnable implements Runnable{
    int number;
    public CalculatorImplementRunnable(int number){
        this.number=number;
    }

    @Override
    public void run() {
        System.out.println(Thread.currentThread().getState());
        for (int i=1; i<=10; i++){
            System.out.printf("%s: %d * %d = %d\n",Thread.
                    currentThread().getName(),number,i,i*number);
        }
    }
}
  class Main{
     public static void main(String... arg){
         Thread threads[]=new Thread[10];
         Thread.State status[]=new Thread.State[10];
         for (int i=0; i<10; i++){
             threads[i]=new Thread(new CalculatorImplementRunnable(i));
             if ((i%2)==0){
                 threads[i].setPriority(Thread.MAX_PRIORITY);
             } else {
                 threads[i].setPriority(Thread.MIN_PRIORITY);
             }
             threads[i].setName("Thread "+i);
         }
         for (int i=0; i<10; i++){
             System.out.println("Main : Status of Thread "+i+" : "+threads[i].getState());
             status[i]=threads[i].getState();
         }
         for(Thread t :threads){
             t.start();
         }
         boolean finish=false;
         while (!finish) {
             for (int i=0; i<10; i++){
                 if (threads[i].getState()!=status[i]) {
                     System.out.println(threads[i] +": "+status[i]);
                     status[i]=threads[i].getState();
                 }
             }
             finish=true;
             for (int i=0; i<10; i++){
                 finish=finish &&(threads[i].getState()==Thread.State.TERMINATED);
             }
         }
     }
 }