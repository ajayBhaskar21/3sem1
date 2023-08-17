<%  
    String uid = request.getParameter("id"); 
    String password = request.getParameter("pass"); 
    HttpSession newSession = request.getSession(); 
    newSession.setAttribute("session-uid", uid); 
    if (uid.equals("cse") && password.equals("123")) {
        response.sendRedirect("success.jsp"); 
    } else { 
        response.sendRedirect("failed.jsp"); 
    }
%>
