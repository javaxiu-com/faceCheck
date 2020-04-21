package mysql;
import java.sql.*;
public class Conn {
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	/**
	 * 加载驱动程序
	 */
public Conn() {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
	} catch (ClassNotFoundException e) {
		System.err.println(e.getMessage());
	}
  }
/**
 * 执行查询操作：select
 */
public ResultSet executeQuery(String sql) {
	try {
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/gyhqq_finance?useSSL=false&serverTimezone=UTC","root","123456");
		stmt = conn.createStatement();
		rs=stmt.executeQuery(sql);
	} catch (SQLException ex){
		System.err.print(ex.getMessage());
	}
	return rs;
}

/**
 * 执行更新操作
 */
public int executeUpdate(String sql) {
	int result = 0;
	try {
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/gyhqq_finance?useSSL=false&serverTimezone=UTC","root","123456");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		result=stmt.executeUpdate(sql);
	} catch (SQLException ex){
		System.out.println(ex);
		result=0;
	}
	return result;
}
/**
 * 关闭数据库连接
 */
public void close() {
	try {
		if (rs!=null) rs.close();
	} catch (Exception e) {
		e.printStackTrace(System.err);
	}
	try {
		if (stmt!=null) stmt.close();
	} catch (Exception e) {
		e.printStackTrace(System.err);
	}
	try {
		if (conn!=null) conn.close();
	} catch (Exception e) {
		e.printStackTrace(System.err);
	}
}
}
