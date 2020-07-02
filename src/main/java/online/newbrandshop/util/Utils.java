/*
	@author:Quang Truong
	@date: Feb 10, 2020
*/

package online.newbrandshop.util;

import javax.servlet.http.HttpServletRequest;
import java.util.Random;

public class Utils {
	public static String GetNameBill()
	{
		Random random=new Random();
		String list="1234567890ABCDEFGHKLMNOPQ";
		String re= "";
		for(int i=0;i<12;i++)
		{
			re+=(list.charAt(random.nextInt(list.length())));
		}
		return re;
	}
	public static String getBaseURL(HttpServletRequest request) {
	    String scheme = request.getScheme();
	    String serverName = request.getServerName();
	    int serverPort = request.getServerPort();
	    String contextPath = request.getContextPath();
	    StringBuffer url =  new StringBuffer();
	    url.append(scheme).append("://").append(serverName);
	    if ((serverPort != 80) && (serverPort != 443)) {
	        url.append(":").append(serverPort);
	    }
	    url.append(contextPath);
	    if(url.toString().endsWith("/")){
	    	url.append("/");
	    }
	    return url.toString();
	}
	
}
