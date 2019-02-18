import org.junit.Test;
        import org.junit.runner.RunWith;
        import org.springframework.test.context.ContextConfiguration;
        import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @ author     ：CZP.
 * @ Date       ：Created in 16:02 2019/1/28
 * @ Description：Spring测试
 * @ Modified By：
 * @ Version    : $
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class BaseTest {

    @Test
    public void test(){
        System.out.println("测试Spring整合Junit4进行单元测试");
    }
}
