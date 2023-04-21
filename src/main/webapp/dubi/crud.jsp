<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="phdhtl.cntt.util.connect"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crud</title>

<style>

td,th{
padding : 5px 20px;
text-algin: center;
}

table tr:not(:first-child){
                cursor: pointer;transition: all .25s ease-in-out;
            }
            table tr:not(:first-child):hover{background-color: violet;}
</style>

</head>
<body>
	<h2>Form Student</h2>
	<form action="crudServlet" method="post" name="form">
		<input type="text" name="id" id="id" placeholder="id" value="${param.id }" />
		<input type="text" name="name" id="name" placeholder="name" value="${param.name }" />
		 <input type="text" name="address" id="address" placeholder="address" value="${param.address }"> <br /> <br />
		<input type="submit" name="action" value="ADD" />
		 <input type="submit" name="action" value="EDIT" /> 
		 <input type="submit" name="action" value="DELETE" /> 

		<input type="reset">

	</form>
	<hr>
	<br />
	<center>
		<p>${alert }</p>
	</center>

	<center>
		<table border="1" id="tbl">
			<tr>
				<th>id</th>
				<th>Name</th>
				<th>Address</th>
			</tr>

			<%
			Connection connection = connect.getConnection();
			
			String sql = "select * from student";
			Statement st = (Statement) connection.createStatement();
					
			ResultSet rs = st.executeQuery(sql);

			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString("id")%></td>
				<td><%=rs.getString("name")%></td>

				<td><%=rs.getString("address")%></td>
				<td><a
					href="?id=<%=rs.getString("id")%>&name=<%=rs.getString("name")%>&address=<%=rs.getString("address")%>"><button>Edit</button></a>

				</td>
			</tr>
			<%
			}
			%>

		</table>
	</center>


	<script type="text/javascript">
		var tbl = document.getElementById('tbl'); // id cuar bang
		for (var i = 1; i < tbl.rows.length; i++){
			tbl.rows[i].onclick  = function(){
				
				// id cua input
				document.getElementById('id').value = this.cells[0].innerHTML; 
				document.getElementById('name').value = this.cells[1].innerHTML;
				document.getElementById('address').value = this.cells[2].innerHTML;
			};
		}
	</script>
</body>
</html>