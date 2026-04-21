<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
table {
	border: 1px solid gray;
	width: auto;}

th, td {
	border: 1px solid gray;
	padding: 3px;
	text-align: left;
}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>사원번호</th>
				<th>사원명</th>
				<th>직급</th>
				<th>상관번호</th>
				<th>입사일자</th>
				<th>급여</th>
				<th>커미션</th>
				<th>부서번호</th>
			</tr>
		</thead>
		<tbody>
			<%
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "scott";
			String password = "tiger";

			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");

				conn = DriverManager.getConnection(url, user, password);

				String sql = "SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno FROM emp";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getInt("empno")%></td>
				<td><%=rs.getString("ename")%></td>
				<td><%=rs.getString("job")%></td>
				<td><%=rs.getInt("mgr") == 0 ? "null" : rs.getInt("mgr")%></td>
				<td><%=sdf.format(rs.getTimestamp("hiredate"))%></td>
				<td><%=rs.getInt("sal")%></td>
				<td><%=rs.getString("comm") == null ? "null" : rs.getString("comm")%></td>
				<td><%=rs.getInt("deptno")%></td>
			</tr>
			<%
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</tbody>
	</table>

</body>
</html>