package faceID;
import com.baidu.ai.aip.utils.*;

import faceID.faceGet;
import faceID.AuthService;
import org.json.JSONObject;
public class faceAdd {
	public static String[] Add(faceGet faceget)   {
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add";
        String faceid =faceget.getFaceid();
        String userid =faceget.getUserid();
        try {
            JSONObject jsonObject  = new JSONObject();
            jsonObject.put("image", faceid);
            jsonObject.put("group_id", "userface");
            jsonObject.put("user_id",userid);
            jsonObject.put("liveness_control", "LOW");
            jsonObject.put("image_type", "BASE64");
            jsonObject.put("quality_control", "LOW");
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
//
//    public static void main(String[] args) throws IOException  {
//        faceAdd.Add();
//   }
//	String filepath="D:\\aaa.png";
//byte[] imagedata1=FileUtil.readFileByBytes(filepath);
//String imgstr1=Base64Util.encode(imagedata1);
//System.out.print(imgstr1);
    // 请求url   faceGet faceget
	//faceGet faceget=new faceGet();
	 //=new faceGet();
//  System.out.print(faceid);        System.out.print(userid);
	public static String[] BSAdd(faceGet faceget)   {
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add";
        String faceid =faceget.getFaceid();
        String boosid =faceget.getBoosid();
        try {

            JSONObject jsonObject  = new JSONObject();
            jsonObject.put("image", faceid);
            jsonObject.put("group_id", "boosface");
            jsonObject.put("user_id",boosid);
            jsonObject.put("liveness_control", "LOW");
            jsonObject.put("image_type", "BASE64");
            jsonObject.put("quality_control", "LOW");
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
}
