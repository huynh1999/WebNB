/*
	@author:Quang Truong
	@date: Feb 10, 2020
*/

package online.newbrandshop.Config;

import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.OAuthTokenCredential;
import com.paypal.base.rest.PayPalRESTException;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

@Configuration
public class PaypalConfig {
	
    private static final String clientId ="ARfB9ANfQJABU132WP_w3kvaCeNLVWxvgsM7Pw7gY1ROVMzcVvWPtKzuk1ihmeUcOsQlY2bhv_L8dKd-";
    private static final String clientSecret="EOIWkTZFnNjK40lhV0bsMXRM9iS_54QtwKWWNQ6KhBT5WlgOfl9GcLdjKAzNZNMgqxJ3Wg51TG6zj_Pi";
    private static final String mode="sandbox";
	
	@Bean
	public Map<String, String> paypalSdkConfig(){
		Map<String, String> configMap = new HashMap<String, String>();
		configMap.put("mode",mode);
		return configMap;
	}
    
	@Bean
	public OAuthTokenCredential oAuthTokenCredential() {
		return new OAuthTokenCredential(clientId, clientSecret,paypalSdkConfig());
	}
	
	@Bean
	public APIContext apiContext() throws PayPalRESTException {
		APIContext context= new APIContext(oAuthTokenCredential().getAccessToken());
		context.setConfigurationMap(paypalSdkConfig());
		return context;
	}
	
}
