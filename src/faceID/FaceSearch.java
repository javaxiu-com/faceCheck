package faceID;
import com.baidu.ai.aip.utils.HttpUtil;
import faceID.faceGet;
import faceID.AuthService;

import org.json.JSONObject;
public class FaceSearch {

	public static String[] search(faceGet faceget) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/search";
        String faceid =faceget.getFaceid();
        try {
            JSONObject jsonObject  = new JSONObject();
            jsonObject.put("image", faceid);
//            jsonObject.put("liveness_control", "LOW");
            jsonObject.put("liveness_control", "HIGH");
            jsonObject.put("group_id_list", "userface");
            jsonObject.put("image_type", "BASE64");
            jsonObject.put("quality_control", "LOW");
//            System.out.println("json===>"+jsonObject.toString());
            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            String accessToken = AuthService.getAuth("APEkukU8XLNh0XRDBNzZWNtd", "r9Dc66v83DgFGMHuGWo6Wai8q0cYtHFb");
            String result = HttpUtil.post(url, accessToken, "application/json", jsonObject.toString());
            System.out.println("成功参数===》"+result);
            String[] sArray=result.split("\"");
//            for (int i = 0; i < sArray.length; i++) {
//                System.out.println(sArray[i]);
//            }
//            String iflog=sArray[2];
//            System.out.println(iflog);
            return sArray;
        } catch (Exception e) {
            e.printStackTrace();
        }
		return null;
    }
	public static String[] BSsearch(faceGet faceget) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/search";
        String faceid =faceget.getFaceid();
        try {
            JSONObject jsonObject  = new JSONObject();
            jsonObject.put("image", faceid);
//            jsonObject.put("liveness_control", "LOW");
            jsonObject.put("liveness_control", "HIGH");
            jsonObject.put("group_id_list", "boosface");
            jsonObject.put("image_type", "BASE64");
            jsonObject.put("quality_control", "LOW");
//            System.out.println("json===>"+jsonObject.toString());
            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            String accessToken = AuthService.getAuth("APEkukU8XLNh0XRDBNzZWNtd", "r9Dc66v83DgFGMHuGWo6Wai8q0cYtHFb");
            String result = HttpUtil.post(url, accessToken, "application/json", jsonObject.toString());
            System.out.println("成功参数===》"+result);
            String[] sArray=result.split("\"");
            for (int i = 0; i < sArray.length; i++) {
                System.out.println(sArray[i]);
            }
            String iflog=sArray[2];if(iflog.equals(":0,")){
                String iflog11=sArray[34]; System.out.println(iflog11);
                String[] con=new String[3];
                con=sArray[34].split(":");System.out.println(con[0]);
                String[] con1=new String[3];con1=con[1].split("\\.");
                int conn=Integer.decode(con1[0]); System.out.println(conn);
            }
            System.out.println(iflog);
            return sArray;
        } catch (Exception e) {
            e.printStackTrace();
        }
		return null;
    }
}
