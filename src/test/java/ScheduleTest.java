import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @ author     ：CZP.
 * @ Date       ：Created in 14:47 2019/2/12
 * @ Description：
 * @ Modified By：
 * @ Version    : $
 */
@Component
public class ScheduleTest {
    @Scheduled(cron = "0/1 * * * * ? *")
    public void ee(){
        System.out.println(11);
    }
}
