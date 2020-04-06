package conn.Department;
import mysql.Conn;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import conn.Department.DepartmentInfo;
public class Depar {
	Conn conn = new  Conn();
	/**
	 * 获取部门全部信息
	 */
	public List<DepartmentInfo> getList() throws SQLException{
		List<DepartmentInfo> list =new ArrayList<DepartmentInfo>();
		String sql="select * from department";
		ResultSet rs=conn.executeQuery(sql);
		while (rs.next()) {
			DepartmentInfo info = new DepartmentInfo();
			info.setDE_name(rs.getString("DE_name"));
			info.setDE_id(rs.getString("DE_id"));
			info.setDE_income(rs.getString("DE_income"));
			info.setDE_expenditure(rs.getString("DE_expenditure"));
			info.setDE_remark(rs.getString("DE_remark"));
			list.add(info);
			}	
		conn.close();return list;
		}
	/**
	 * 获取部门名字信息
	 */
	public List<DepartmentInfo> getde() throws SQLException{
		List<DepartmentInfo> list =new ArrayList<DepartmentInfo>();
		String sql="select DE_name from department";
		ResultSet rs=conn.executeQuery(sql);
		while (rs.next()) {
			DepartmentInfo info = new DepartmentInfo();
			info.setDE_name(rs.getString("DE_name"));
			list.add(info);
			}	
		conn.close();
		return list;
		}
	/**
	 * 获取某部门信息
	 */
	public DepartmentInfo getONEde(String num) throws SQLException{
		DepartmentInfo deinfo=new DepartmentInfo();
		String sql="select * from department where DE_id="+"'"+num+"'";
		ResultSet rs=conn.executeQuery(sql);
		if(rs.next()) {
			deinfo.setDE_id(rs.getString("DE_id"));
			deinfo.setDE_name(rs.getString("DE_name"));
			deinfo.setDE_income(rs.getString("DE_income"));
			deinfo.setDE_expenditure(rs.getString("DE_expenditure"));
			deinfo.setDE_remark(rs.getString("DE_remark"));
		}
		conn.close();
		return deinfo;
	}
	/**
	 * 编辑
	 */
	public int updatede(DepartmentInfo info) {
		String sql="update department set DE_name='"+info.getDE_name()+"',DE_income='"+info.getDE_income()
		+"',DE_expenditure='"+info.getDE_expenditure()+"',DE_remark='"+info.getDE_remark()+"' where DE_id='"+info.getDE_id()+"'";
		int result=0;
		result = conn.executeUpdate(sql);
		conn.close();
		return result; 
	}
	/**
	 * 添加部门
	 */
	public int inseert(DepartmentInfo info) {
		String sql="insert into department(DE_name,DE_income,DE_expenditure,DE_remark) values ";
		sql=sql+"('"+info.getDE_name()+"','"+info.getDE_income()+"','"+info.getDE_expenditure()+"','"+info.getDE_remark()+"')";
		int result=0;
		System.out.println(sql);
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
		
	}
	/**
	 * 
	 * 删除部门
	 */
	public int  deleate(String num) {
		String sql="delete from department where DE_id='"+num+"'";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
}
