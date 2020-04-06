package conn.Boos;
import conn.Boos.BoosInfo;
import mysql.Conn;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class boosLogin {
	Conn conn = new  Conn();
	/**
	 * 获取BOOS列表
	 * @return
	 * @throws SQLException
	 */
public List<BoosInfo> getList() throws SQLException{
	List<BoosInfo> list =new ArrayList<BoosInfo>();
	String sql="select * from boos";
	ResultSet rs=conn.executeQuery(sql);
	while (rs.next()) {
		BoosInfo info = new BoosInfo();
		info.setBOOS_name(rs.getString("BOOS_name"));
		info.setBOOS_id(rs.getString("BOOS_id"));
		list.add(info);
		}	
	conn.close();return list;
	}
/**
 * 获取更新时BOOS列表
 * @return
 * @throws SQLException
 */
public List<BoosInfo> degetList(String id) throws SQLException{
List<BoosInfo> list =new ArrayList<BoosInfo>();
String sql="select * from boos where BOOS_id!="+"'"+id+"'";
ResultSet rs=conn.executeQuery(sql);
while (rs.next()) {
	BoosInfo info = new BoosInfo();
	info.setBOOS_name(rs.getString("BOOS_name"));
	info.setBOOS_id(rs.getString("BOOS_id"));
	list.add(info);
	}	
conn.close();return list;
}
/**
 * 添加
 * @param info
 * @return
 */
public int insert(BoosInfo info)
{
	String sql="insert into boos(BOOS_name,BOOS_password)values ";
	sql=sql+"('"+info.getBOOS_name()+"','"+info.getBOOS_password()+"')";
	int result=0;
	System.out.println(sql);
	result=conn.executeUpdate(sql);
	conn.close();
	return result;
}
/**
 * 登陆 
 * @return 
 */
public boolean boosLogn(BoosInfo info) throws SQLException{
	String sql="select * from boos where BOOS_id = "+"'"+info.getBOOS_id()+"'"+"and BOOS_password="+"'"+info.getBOOS_password()+"'";
	ResultSet rs=conn.executeQuery(sql);//执行数据库查询操作并获取结果集
	boolean flag=false;//初始化flag
	if(rs.next()){//判断结果
		 flag=true;
		 }else{
		 flag=false;
		 }
	conn.close();
	return flag;
}
/**
 * 查询用户名字
 */
public String getboosname(String num) throws SQLException{
	String a =null;
	List<BoosInfo> list =new ArrayList<BoosInfo>();
	String sql="SELECT BOOS_name FROM boos WHERE BOOS_id = "+"'"+num+"'";
	ResultSet rs=conn.executeQuery(sql);//执行数据库查询操作并获取结果集
	while(rs.next()) {
		BoosInfo info = new BoosInfo();
		info.setBOOS_name(rs.getString("BOOS_name"));
		list.add(info);
	}
	for(BoosInfo Bsin:list){ a =(Bsin.getBOOS_name()).toString();}
	conn.close();
	return a;
}
/**
 * 查询用户密码
 */
public String getboospass(String num) throws SQLException{
	String a =null;
	List<BoosInfo> list =new ArrayList<BoosInfo>();
	String sql="SELECT BOOS_password FROM boos WHERE BOOS_id = "+"'"+num+"'";
	ResultSet rs=conn.executeQuery(sql);//执行数据库查询操作并获取结果集
	while(rs.next()) {
		BoosInfo info = new BoosInfo();
		info.setBOOS_password(rs.getString("BOOS_password"));
		list.add(info);
	}
	for(BoosInfo Bsin:list){ a =(Bsin.getBOOS_password()).toString();}
	conn.close();
	return a;
}
/**
 * 查询用户ID
 */
public String getboosID(String num) throws SQLException{
	String a =null;
	List<BoosInfo> list =new ArrayList<BoosInfo>();
	String sql="SELECT BOOS_id FROM boos WHERE BOOS_name = "+"'"+num+"'";
	ResultSet rs=conn.executeQuery(sql);//执行数据库查询操作并获取结果集
	while(rs.next()) {
		BoosInfo info = new BoosInfo();
		info.setBOOS_id(rs.getString("BOOS_id"));
		list.add(info);
	}
	for(BoosInfo Bsin:list){ a =(Bsin.getBOOS_id()).toString();}
	conn.close();
	return a;
}
/**
 * 更新数据
 */
public int update(BoosInfo info) {
	String sql="update boos set BOOS_name='"+info.getBOOS_name()+"',BOOS_password='"+info.getBOOS_password()+"' where BOOS_id ='"+info.getBOOS_id()+"'";
	int result=0;
	result = conn.executeUpdate(sql);
	conn.close();
	return result; 
}
/**
 * 删除数据
 */
public int delete(String boosid) {
	String sql="delete from boos where BOOS_id='"+boosid+"'";
	int result=0;
	result=conn.executeUpdate(sql);
	conn.close();
	return result;
}
}
