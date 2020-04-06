package conn.Post;
import mysql.Conn;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.Post.PostInfo;
public class Post {
	Conn conn = new  Conn();
	/**
	 * 获取岗位全部信息
	 */
	public List<PostInfo> getList() throws SQLException{
		List<PostInfo> list =new ArrayList<PostInfo>();
		String sql="select * from post";
		ResultSet rs=conn.executeQuery(sql);
		while (rs.next()) {
			PostInfo info = new PostInfo();
			info.setPO_name(rs.getString("PO_name"));
			info.setPO_id(rs.getString("PO_id"));
			info.setPO_department(rs.getString("PO_department"));
			info.setPO_wages(rs.getString("PO_wages"));
			info.setPO_remark(rs.getString("PO_remark"));
			list.add(info);
			}	
		conn.close();return list;
		}
	/**
	 * 获取某部门岗位信息
	 */
	public List<PostInfo> getpo(String num) throws SQLException{
		List<PostInfo> list =new ArrayList<PostInfo>();
		String sql="select PO_name from post where PO_department="+"'"+num+"'";
		ResultSet rs=conn.executeQuery(sql);
		while (rs.next()) {
			PostInfo info = new PostInfo();
			info.setPO_name(rs.getString("PO_name"));
			list.add(info);
			}
		
		conn.close();return list;
		}
	/**
	 * 获取全部岗位
	 */
	public List<PostInfo> getpoour() throws SQLException{
		List<PostInfo> list =new ArrayList<PostInfo>();
		String sql="select PO_name from post ";
		ResultSet rs=conn.executeQuery(sql);
		while (rs.next()) {
			PostInfo info = new PostInfo();
			info.setPO_name(rs.getString("PO_name"));
			list.add(info);
			}	
		conn.close();
		return list;
		}
	/**
	 * 获取某一个岗位全部信息
	 */
	public PostInfo getonePO(String num) throws SQLException{
		PostInfo info=new PostInfo();
		String sql="select * from post where PO_id='"+num+"'";
		ResultSet rs=conn.executeQuery(sql);
		if(rs.next()) {
			info.setPO_id(rs.getString("PO_id"));
			info.setPO_name(rs.getString("PO_name"));
			info.setPO_department(rs.getString("PO_department"));
			info.setPO_wages(rs.getString("PO_wages"));
			info.setPO_remark(rs.getString("PO_remark"));
		}
		conn.close();
		return info;
	}
	/**
	 * 更新岗位信息
	 */
	public int update(PostInfo info) {
		String sql="update post set PO_name='"+info.getPO_name()+"',PO_department='"+info.getPO_department()+"',PO_wages='"
		+info.getPO_wages()+"',PO_remark='"+info.getPO_remark()+"' where PO_id='"+info.getPO_id()+"'";
		int result=0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result; 
	}
	/**
	 * 删除岗位信息
	 */
	public  int detele(String num) {
		String sql="delete from post where PO_id='"+num+"'";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 添加岗位信息
	 */
	public int insert(PostInfo info) {
		String sql="insert into post (PO_name,PO_department,PO_wages,PO_remark) values ";
		sql=sql+"('"+info.getPO_name()+"','"+info.getPO_department()+"','"+info.getPO_wages()+"','"+info.getPO_remark()+"')";
		int result=0;
		System.out.println(sql);
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
}
