

<%@ page import = "java.sql.*" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");


try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "root");
    PreparedStatement ps = conn.prepareStatement("insert into tb(username, password) values (?, ?)");
    ps.setString(1, username);
    ps.setString(2, password);
    int x = ps.executeUpdate();
    if (x > 0) {
        out.println("Registration success");
    }
    else {
        out.println("Registration failed");
    }

}
catch(Exception e) {
    out.println(e);
}


%>


