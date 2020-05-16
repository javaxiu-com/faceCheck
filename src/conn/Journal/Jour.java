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
		String startFormat = formatter.format(date)+" 09:00:00";
		String endFormat = formatter.format(date)+" 18:00:00";
		String overtimeFormat = formatter.format(date)+" 20:00:00";
		//找当前月
		SimpleDateFormat formatters = new SimpleDateFormat("yyyy-MM");
		String startformat1 = formatters.format(date)+"-01 00:00:00";
		String endformat1 = formatters.format(date)+"-31 00:00:00";
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
			String jo_time = info.getJO_time();
			int h = format.compareTo(startFormat);//当前时间大于下班时间
			int i = format.compareTo(endFormat);//当前时间大于下班时间
			int j = format.compareTo(overtimeFormat);//当前时间大于加班下班时间
			String JO_status = "";
			int JO_pay = 0;
			if (h > 0) {
				JO_status = "迟到";
			}
			if (i > 0 && j < 0) {
				JO_status = "正常";
			}
			if (j > 0 && j > 0) {
				JO_status = "加班";
				JO_pay = 5;
			}
			if (i < 0) {
				JO_status = "早退";
				JO_pay = -5;
			}
			String sql="update journal set JO_endtime="+"'"+info.getJO_time()+"'"+",JO_status="+"'"+JO_status+"'"+",JO_pay="+"'"+JO_pay+"'"+" where JO_staff="+"'"+info.getJO_staff()+"'"+"and JO_remark='1'";
			int result=0;
			result=conn.executeUpdate(sql);
			conn.close();
			//更新工资表
			String sqls="select * from journal where JO_staff="+"'"+info.getJO_staff()+"'"+"and JO_time>="+"'"+startformat1+"'"+"and JO_time<="+"'"+endformat1+"'"+"and JO_remark='1'";
			ResultSet rs1=conn.executeQuery(sqls);
			int a = 0;
			while (rs1.next()) {
				a = a + Integer.parseInt(rs1.getString(8));
			}
			if (a > 0) {
				String sqlss="update wages set WA_reward="+"'"+a+"'"+" where WA_num="+"'"+info.getJO_staff()+"'";
				int resultss=conn.executeUpdate(sqlss);
				conn.close();
			}
			if (a < 0) {
				String sqlss="update wages set WA_fine="+"'"+a+"'"+" where WA_num="+"'"+info.getJO_staff()+"'";
				int resultss=conn.executeUpdate(sqlss);
				conn.close();
			}
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
