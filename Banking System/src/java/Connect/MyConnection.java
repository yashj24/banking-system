
package Connect;
import java.sql.*;
public class MyConnection
{
    static Connection con=null;
    static
    {
        try
        {    
         Class.forName("com.mysql.jdbc.Driver");

        }
        catch(Exception e)
        {
            System.out.println(e);
        }    
    }
   public static Connection getConnection() throws SQLException
   {
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root","root");
        return(con);     
   }
}
