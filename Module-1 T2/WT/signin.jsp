<%@ page import="java.sql.*" %>
    <% 
        String enteredUsername=request.getParameter("username"); 
        String enteredPassword=request.getParameter("password");
        try { Class.forName("com.mysql.jdbc.Driver"); 
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root" , "root" );
            PreparedStatement ps=conn.prepareStatement("select * from tb where username=? and password=?");
            ps.setString(1, enteredUsername);
            ps.setString(2, enteredPassword); 
            ResultSet rs=ps.executeQuery(); 
            if (rs.next()) { 
                // User found, authentication success
                out.println("Authentication successful"); 
            } 
            else { 
                // User not found or authentication failed
                out.println("Authentication failed"); 
            } 
        } catch (Exception e) { 
            out.println(e); 
        } 
    %>
