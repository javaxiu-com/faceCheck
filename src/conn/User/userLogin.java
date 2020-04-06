package conn.User;

import conn.User.userInfo;
import mysql.Conn;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class userLogin {
		Conn conn = new  Conn();
		/**
		 * 获取用户列表
		 * @return
		 * @throws SQLException
		 */
	public List<userInfo> getList() throws SQLException{
		List<userInfo> list =new ArrayList<userInfo>();
		String sql="select * from staff";
		ResultSet rs=conn.executeQuery(sql);
		while (rs.next()) {
			userInfo info = new userInfo();
			info.setST_num(rs.getString("ST_num"));
			info.setST_name(rs.getString("ST_name"));
			info.setST_password(rs.getString("ST_password"));
			info.setST_num(rs.getString("ST_num"));
			info.setST_sex(rs.getString("ST_sex"));
			info.setST_ago(rs.getString("ST_ago"));
			info.setST_department(rs.getString("ST_department"));
			info.setST_post(rs.getString("ST_post"));
			info.setST_entrytime(rs.getString("ST_entrytime"));
			info.setST_quittime(rs.getString("ST_quittime"));
			info.setST_worktime(rs.getString("ST_worktime"));
			info.setST_condition(rs.getString("ST_condition"));
			info.setST_phone(rs.getString("ST_phone"));
			info.setST_address(rs.getString("ST_address"));
			info.setST_birthday(rs.getString("ST_birthday"));
			info.setST_workhours(rs.getString("ST_workhours"));
			info.setST_aggworkhours(rs.getString("ST_aggworkhours"));
			info.setST_power(rs.getString("ST_power"));
			info.setST_reamrks(rs.getString("ST_reamrks"));
			list.add(info);
			}	
		conn.close();return list;
		}
	/**
	 * 添加
	 * @param info
	 * @return
	 */
	public int insert(userInfo info)
	{
		String sql="insert into staff(ST_name,ST_password,ST_sex,ST_ago,ST_department,ST_post,ST_entrytime,ST_quittime,ST_worktime,"
				+ "ST_condition,ST_phone,ST_address,ST_birthday,ST_workhours,ST_aggworkhours,ST_power,ST_reamrks)values ";
		sql=sql+"('"+info.getST_name()+"','"+info.getST_password()+"','"+info.getST_sex()+"','"+info.getST_ago()+"','"+info.getST_department()
		+"','"+info.getST_post()+"','"+info.getST_entrytime()+"','"+info.getST_quittime()+"','"+info.getST_worktime()+"','"+info.getST_condition()
		+"','"+info.getST_phone()+"','"+info.getST_address()+"','"+info.getST_birthday()+"','"+info.getST_workhours()
		+"','"+info.getST_aggworkhours()+"','"+info.getST_power()+"','"+info.getST_reamrks()+"')";
		int result=0;
		System.out.println(sql);
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 员工登陆 
	 * @return 
	 */
	public boolean userLogn(userInfo info) throws SQLException{
		String sql="select * from staff where ST_num = "+"'"+info.getST_num()+"'"+"and ST_password="+"'"+info.getST_password()+"'";
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
	 * 获取员工权限等级
	 */
	public String getPower(String num) throws SQLException{
		String a =null;
		List<userInfo> list =new ArrayList<userInfo>();
		String sql="SELECT ST_power FROM staff WHERE ST_num = "+"'"+num+"'";
		ResultSet rs=conn.executeQuery(sql);//执行数据库查询操作并获取结果集
		while(rs.next()) {
			userInfo info = new userInfo();
			info.setST_power(rs.getString("ST_power"));
			list.add(info);
		}
		for(userInfo usin:list){ a =(usin.getST_power()).toString();}
		conn.close();
		return a;
	}
	/**
	 * 获取单个员工数据
	 */
	public userInfo getUser(String num) throws SQLException{
		userInfo info = new userInfo();
		String sql="select * from staff where ST_num ="+"'"+num+"'";
		ResultSet rs=conn.executeQuery(sql);
		if(rs.next()) {
			info.setST_num(rs.getString("ST_num"));
			info.setST_name(rs.getString("ST_name"));
			info.setST_password(rs.getString("ST_password"));
			info.setST_sex(rs.getString("ST_sex"));
			info.setST_ago(rs.getString("ST_ago"));
			info.setST_department(rs.getString("ST_department"));
			info.setST_post(rs.getString("ST_post"));
			info.setST_entrytime(rs.getString("ST_entrytime"));
			info.setST_quittime(rs.getString("ST_quittime"));
			info.setST_worktime(rs.getString("ST_worktime"));
			info.setST_condition(rs.getString("ST_condition"));
			info.setST_phone(rs.getString("ST_phone"));
			info.setST_address(rs.getString("ST_address"));
			info.setST_birthday(rs.getString("ST_birthday"));
			info.setST_workhours(rs.getString("ST_workhours"));
			info.setST_aggworkhours(rs.getString("ST_aggworkhours"));
			info.setST_power(rs.getString("ST_power"));
			info.setST_reamrks(rs.getString("ST_reamrks"));
		}
		conn.close();
		return info;
	}
	/**
	 * 编辑
	 */
	public int update(userInfo info) {
		String sql="update staff set ST_name='"+info.getST_name()+"',ST_password='"+info.getST_password()
		+"',ST_sex='"+info.getST_sex()+"',ST_ago='"+info.getST_ago()+
		"',ST_entrytime='"+info.getST_entrytime()+"',ST_quittime='"+info.getST_quittime()+
		"',ST_worktime='"+info.getST_worktime()+"',ST_condition='"+info.getST_condition()+
		"',ST_phone='"+info.getST_phone()+"',ST_address='"+info.getST_address()+
		"',ST_birthday='"+info.getST_birthday()+"',ST_workhours='"+info.getST_workhours()+
		"',ST_aggworkhours='"+info.getST_aggworkhours()+"',ST_power='"+info.getST_power()+
		"',ST_reamrks='"+info.getST_reamrks()+"' where ST_num ='"+info.getST_num()+"'";
		int result=0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result; 
	}
	/**
	 * 删除员工
	 */
	public int delete(String num) {
		String sql="delete from staff where ST_num='"+num+"'";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 获取注册员工id
	 */
	public String getuserID(String num) throws SQLException{
		String a =null;
	List<userInfo> list=new ArrayList<userInfo>();
	String sql="SELECT ST_num FROM staff WHERE ST_name = "+"'"+num+"'";
	ResultSet rs=conn.executeQuery(sql);//执行数据库查询操作并获取结果集
	while(rs.next()) {
		userInfo info=new userInfo();
		info.setST_num(rs.getString("ST_num"));
		list.add(info);
	}
	for(userInfo use:list) { a=(use.getST_num()).toString();}
	conn.close();
	return a;
	}
	
}
