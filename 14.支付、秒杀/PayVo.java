package com.atguigu.gmall.payment.vo;

import lombok.Data;

@Data
public class PayVo {
    // 商户订单号，商户网站订单系统中唯一订单号，必填
    private String out_trade_no;
    // 付款金额，必填
    private String total_amount;
    // 订单名称 必填
    private String subject;
    // 支付宝会在异步通知时将该参数原样返回。本参数必须进行UrlEncode之后才可以发送给支付宝。可选
    private String passback_params;
    // 销售产品码，目前仅支持FAST_INSTANT_TRADE_PAY
    private final String product_code = "FAST_INSTANT_TRADE_PAY";
}
