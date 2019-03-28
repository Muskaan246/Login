<%@ page import ="java.sql.*" %>
<%
       try {
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
   Class.forName("org.apache.derby.jdbc.ClientDriver");
    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/login");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into members values('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "')");
    if (i > 0) {
     
        response.sendRedirect("welcome.jsp");
      
    } else {
        response.sendRedirect("index.jsp");
    }
     }
    catch (SQLException err){
        System.out.println(err.getMessage());
    }
%>
