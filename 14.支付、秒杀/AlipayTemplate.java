package com.atguigu.gmall.payment.config;

import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.atguigu.gmall.payment.vo.PayVo;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@ConfigurationProperties(prefix = "alipay")
@Component
@Data
public class AlipayTemplate {

    // 支付宝网关； https://openapi.alipaydev.com/gateway.do
    private String gatewayUrl;
    //在支付宝创建的应用的id
    private String app_id;
    // 商户私钥，您的PKCS8格式RSA2私钥
    private String merchant_private_key;
    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    private String alipay_public_key;
    // 服务器[异步通知]页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    private String notify_url;
    // 同步通知，支付成功，一般跳转到成功页
    private String return_url;

    public String pay(PayVo vo) throws AlipayApiException {

        //1、根据支付宝的配置生成一个支付客户端
        AlipayClient alipayClient = new DefaultAlipayClient(gatewayUrl, app_id, merchant_private_key, "json", "utf-8", alipay_public_key, "RSA2");
        //2、创建一个支付请求 //设置请求参数
        AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
        // 同步回调路径
        request.setReturnUrl(return_url);
        // 异步回调路径
        request.setNotifyUrl(notify_url);
        // 业务参数
        request.setBizContent(JSON.toJSONString(vo));
        String result = alipayClient.pageExecute(request).getBody();

        //会收到支付宝的响应，响应的是一个页面，只要浏览器显示这个页面，就会自动来到支付宝的收银台页面
        System.out.println("支付宝的响应："+result);
        return result;
    }
}
