package com.ispan6.service.mallsystem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.response.AlipayTradePagePayResponse;
import com.ispan6.bean.mallsystem.OrderBean;

@Service
@Transactional
public class AlipayService {

	@Autowired
	private OrderBeanService orderBeanService;

	@Autowired
	private AlipayClient alipayClient;

	public String payPageCreate(Integer orderId,Double exchange) {
		OrderBean order = orderBeanService.findById(orderId);

		try {
			AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
//			request.setNotifyUrl("https://ac4d-219-70-212-73.jp.ngrok.io/tradeNotify");
			request.setReturnUrl("http://localhost:8080/toMyOrderPage");
			JSONObject bizContent = new JSONObject();
			bizContent.put("out_trade_no", orderId.toString());
			double price = order.getPrice() / exchange;
			double price2 = (double)Math.round(price*100)/100;
			bizContent.put("total_amount",price2 );
			bizContent.put("subject", "order test");
			bizContent.put("product_code", "FAST_INSTANT_TRADE_PAY");
			// bizContent.put("time_expire", "2022-08-01 22:00:00");

			// 商品明细信息，按需传入
//		JSONArray goodsDetail = new JSONArray();
//		JSONObject goods1 = new JSONObject();
//		goods1.put("goods_id", "goodsNo1");
//		goods1.put("goods_name", "子商品1");
//		goods1.put("quantity", 1);
//		goods1.put("price", 0.01);
//		goodsDetail.add(goods1);
//		bizContent.put("goods_detail", goodsDetail);

			request.setBizContent(bizContent.toString());
			AlipayTradePagePayResponse response = alipayClient.pageExecute(request);
			if (response.isSuccess()) {
				System.out.println("调用成功");
				order.setStatus(1);
				orderBeanService.save(order);
				return response.getBody();
			} else {
				System.out.println("调用失败");
			}

		} catch (AlipayApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "exception";
	}

}
