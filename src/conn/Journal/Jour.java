package conn.Journal;
import conn.Boos.BoosInfo;
import conn.Journal.JournalInfo;
import mysql.Conn;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class Jour {
	Conn conn = new  Conn();
	/**
	 * 添加打卡考勤记录
	 * @param info
	 * @return
	 */
	public int insert(JournalInfo info) throws SQLException {
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String format = formatter.format(date)+" 00:00:00";
		//是否是首次打卡
		List<JournalInfo> list =new ArrayList<JournalInfo>();
		String sql1="select * from journal where JO_staff="+"'"+info.getJO_staff()+"'"+"and JO_time>="+"'"+format+"'"+"and JO_remark='1'";
		ResultSet rs=conn.executeQuery(sql1);
		while (rs.next()) {
			JournalInfo journalInfo = new JournalInfo();
			journalInfo.setJO_time(rs.getString("JO_time"));
			journalInfo.setJO_staff(rs.getString("JO_staff"));
			list.add(info);
		}
		conn.close();
		if (list.size() > 0) {
			//非首次打卡(下班卡)
			String sql="update journal set JO_endtime="+"'"+info.getJO_time()+"'"+"where JO_staff="+"'"+info.getJO_staff()+"'"+"and JO_remark='1'";
			int result=0;
			result=conn.executeUpdate(sql);
			conn.close();
			return result;
		}
		//首次打卡(上班卡)
		String sql="insert into journal(JO_time,JO_staff,JO_things,JO_remark)values ";
		sql=sql+"('"+info.getJO_time()+"','"+info.getJO_staff()+"','"+info.getJO_things()+"','"+info.getJO_remark()+"')";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
	/**
	 * 删除打卡考勤日志
	 */
	public int delete(String num) {
		String sql="delete from journal where JO_id='"+num+"'";
		int result=0;
		result=conn.executeUpdate(sql);
		conn.close();
		return result;
	}
}
