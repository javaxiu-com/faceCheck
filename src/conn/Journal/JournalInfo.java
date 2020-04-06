package conn.Journal;

public class JournalInfo {
	private String JO_id; //日志id
	private String JO_time; //上班时间
	private String JO_endtime; //下班时间
	private String JO_staff; //操作人
	private String JO_things; //操作事务
	private String JO_remark; //备注
	public String getJO_id() {
		return JO_id;
	}
	public void setJO_id(String jO_id) {
		JO_id = jO_id;
	}
	public String getJO_time() {
		return JO_time;
	}
	public void setJO_time(String jO_time) {
		JO_time = jO_time;
	}
	public String getJO_endtime() {
		return JO_time;
	}
	public void setJO_endtime(String jO_endtime) {
		JO_time = jO_endtime;
	}
	public String getJO_staff() {
		return JO_staff;
	}
	public void setJO_staff(String jO_staff) {
		JO_staff = jO_staff;
	}
	public String getJO_things() {
		return JO_things;
	}
	public void setJO_things(String jO_things) {
		JO_things = jO_things;
	}
	public String getJO_remark() {
		return JO_remark;
	}
	public void setJO_remark(String jO_remark) {
		JO_remark = jO_remark;
	}
}
