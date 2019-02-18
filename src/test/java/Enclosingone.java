/**
 * @ author     ：CZP.
 * @ Date       ：Created in 18:02 2019/2/13
 * @ Description：
 * @ Modified By：
 * @ Version    : $
 */
public class Enclosingone {

    public class Insideone{

    }

    public static void main(String[] args) {
        Enclosingone eo=new Enclosingone();
        Enclosingone.Insideone ei=eo.new Insideone();
    }
}
