package conn.Wages;
import conn.Wages.WagesInfo;
import mysql.*;
import java.sql.ResultSet;
import java.sql.SQLException;



public class wage {
	Conn conn=new Conn();
	/**
	 * 获取单个员工工资信息
	 * @throws SQLException 
	 */
	public WagesInfo getoneWage(String num) throws SQLException {
		WagesInfo info=new WagesInfo();
		String sql="select * from wages where wA_num='"+num+"'";
		ResultSet rs=conn.executeQuery(sql);
		if(rs.next()) {
		info.setWA_num(rs.getString("WA_num"));
		info.setWA_name(rs.getString("WA_name"));
		info.setWA_department(rs.getString("WA_department"));
		info.setWA_post(rs.getString("WA_post"));
		info.setWA_wages(rs.getString("WA_wages"));
		info.setWA_reward(rs.getString("WA_reward"));
		info.setWA_overtime(rs.getString("WA_overtime"));
		info.setWA_fine(rs.getString("WA_fine"));
		info.setWA_actual(rs.getString("WA_actual"));
		info.setWA_remark(rs.getString("WA_remark"));
		}
		conn.close();
		return info;
	}

	/**
	 * 编辑单个员工工资信息
	 */
	public int  uponeWage(WagesInfo info) {
	String sql="update wages set WA_name='"+info.getWA_name()+"',WA_department='"+info.getWA_department()
	+"',WA_post='"+info.getWA_post()+"',WA_wages='"+info.getWA_wages()+"',WA_reward='"+info.getWA_reward()
	+"',WA_overtime='"+info.getWA_overtime()+"',WA_fine='"+info.getWA_fine()+"',WA_actual='"+info.getWA_actual()
	+"',WA_remark='"+info.getWA_remark()+"' where WA_num='"+info.getWA_num()+"'";
	int result=0;
	result = conn.executeUpdate(sql);
	conn.close();
	return result;
	}
	/**
	 * 删除此员工工资信息
	 */
	public int delete(String num) {
		String sql="delete from wages where WA_num='"+num+"'";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 添加员工工资表信息
	 */
	public int insertWage(WagesInfo info) {
		String sql="insert into wages(WA_name,WA_department,WA_post,WA_wages,WA_reward,WA_overtime,WA_fine,WA_actual"
				+ ",WA_remark,WA_num)values";
		sql=sql+"('"+info.getWA_name()+"','"+info.getWA_department()+"','"+info.getWA_post()+"','"+info.getWA_wages()+"','"+info.getWA_reward()+"','"
				+info.getWA_overtime()+"','"+info.getWA_fine()+"','"+info.getWA_actual()+"','"+info.getWA_remark()+"','"+info.getWA_num()+"')";
		int result=0;
		System.out.println(sql);
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
}
