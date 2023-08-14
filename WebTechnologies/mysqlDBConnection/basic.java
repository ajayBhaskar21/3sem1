package javaapplication1;
import java.sql.*;
// file name should be changed acco to your program.
public class JavaApplication1 {

    public static void main(String rags[])throws SQLException,ClassNotFoundException
    {   
        /* 
        To Create Table in a database.
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/helloworld","root","root");
        Statement stmt=con.createStatement();
        String query="create table student1(Name varchar(20),RollNo varchar(30))";
        stmt.executeUpdate(query);
        con.close();
        */
        
        // To insert values in the database.
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/helloworld", "root", "root");
        Statement stmt = con.createStatement();
        String query = "insert into student1 values('ajay', '211FA04010')";
        stmt.executeUpdate(query);
        con.close();
         
    }

    
}
