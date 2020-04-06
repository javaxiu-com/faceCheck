package faceID;
import com.baidu.ai.aip.utils.*;

import faceID.AuthService;
import org.json.JSONObject;

public class faceDel {
	public static String[] Del(String group,String user)   {
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/delete";
        try {
            JSONObject jsonObject  = new JSONObject();
            jsonObject.put("group_id", group);
            jsonObject.put("user_id",user);
            System.out.println("json===>"+jsonObject.toString());
            String accessToken = AuthService.getAuth("APEkukU8XLNh0XRDBNzZWNtd", "r9Dc66v83DgFGMHuGWo6Wai8q0cYtHFb");
            String result = HttpUtil.post(url, accessToken, "application/json", jsonObject.toString());
            System.out.println("成功参数===》"+result);
            String[] sArray=result.split("\"");
            return sArray;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
//	public static void main(String[] args) {
//    	Del("boosface", "16");
//	}
}
