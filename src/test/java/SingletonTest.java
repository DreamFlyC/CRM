/**
 * @ author     ：CZP.
 * @ Date       ：Created in 11:09 2019/2/12
 * @ Description：并发下的单例模式
 * @ Modified By：
 * @ Version    : $
 */
public class SingletonTest {
    /*
     * create by: CZP
     * description:静态内部类模式
     * create time: 11:10 2019/2/12
     * @return
     */
    private static class Singleton{
        private static final SingletonTest single=new SingletonTest();
    }
    public static SingletonTest getInstance(){
        return Singleton.single;
    }

    public static void main(String[] args) {
        Runnable runnable = () -> System.out.println(SingletonTest.getInstance());
        Thread t1=new Thread(runnable,"t1");
        Thread t2=new Thread(runnable,"t2");
        t1.start();
        t2.start();
    }
}

