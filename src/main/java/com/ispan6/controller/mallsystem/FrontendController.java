package com.ispan6.controller.mallsystem;

import java.io.IOException;
import java.util.ArrayList;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan6.bean.mallsystem.OrderBean;
import com.ispan6.bean.mallsystem.OrderItems;
import com.ispan6.bean.mallsystem.Product;
import com.ispan6.bean.mallsystem.ProductLabel;
import com.ispan6.bean.mallsystem.ProductType;
import com.ispan6.bean.mallsystem.ShoppingCartItem;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.service.mallsystem.OrderBeanService;
import com.ispan6.service.mallsystem.OrderItemService;
import com.ispan6.service.mallsystem.ProductLabelService;
import com.ispan6.service.mallsystem.ProductService;
import com.ispan6.service.mallsystem.ProductTypeService;
import com.ispan6.service.mallsystem.ShoppingCartItemService;

@Controller
public class FrontendController {

	@Autowired
	private ProductService productService;

	@Autowired
	private ProductLabelService productLabelService;

	@Autowired
	private ProductTypeService productTypeService;

	@Autowired
	private ShoppingCartItemService shoppingCartItemService;

	@Autowired
	private OrderBeanService orderBeanService;

	@Autowired
	private OrderItemService orderItemService;

	@GetMapping("/product")
	public String goToMall() {
		return "productpage2";
	}

	/**
	 * 重置整個網頁，同時將資料product、label、type存進session
	 * 
	 * @param session
	 * @return
	 */
	@GetMapping("/getProduct")
	@ResponseBody
	public List<Product> getProduct() {
		List<Product> topsales = productService.findTop5BySales();
		for (Product product : topsales) {
			product.setLabel(3);
			productService.insertProduct(product);
		}
		return productService.getAllProductOnSell();
	}

	/**
	 * 開啟購物車時取得商品資料
	 * 
	 * @param session
	 * @param model
	 */
	@GetMapping("/openShoppingCart")
	@ResponseBody
	public List<ShoppingCartItem> openShoppingCart(HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		if (member != null) {
			return shoppingCartItemService.findAllByMemberId(member.getId());
		}
		return null;
	}

	/**
	 * 商品按照價格高到低進行排序
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/priceH2L")
	@ResponseBody
	public List<Product> priceHightToLow() {
		return productService.findAllProductOrderByPriceDesc();
	}

	/**
	 * 商品按照價格低到高進行排序
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/priceL2H")
	@ResponseBody
	public List<Product> priceLowToHight() {
		return productService.findAllProductOrderByPriceAsc();
	}

	@GetMapping("/salesH2L")
	@ResponseBody
	public List<Product> salesLowToHight() {
		return productService.findAllProductOrderBySales();
	}

	/**
	 * 按照商品價格範圍進行查找
	 * 
	 * @param lowPrice
	 * @param highPrice
	 * @param model
	 * @return
	 */
	@GetMapping("/searchByHLPrice")
	@ResponseBody
	public List<Product> searchByHLPrice(@RequestParam Double lowPrice, Double highPrice) {
		return productService.findAllByPrice(lowPrice, highPrice);
	}

	@GetMapping("/searchByKey")
	@ResponseBody
	public List<Product> searchByKey(@RequestParam String keyword) {
		return productService.findAllProductByName(keyword);
	}

	@GetMapping("/getRecommand")
	@ResponseBody
	public Product getRecommand() {
		int id = (int) (Math.random() * 24 + 1);
		return productService.findById(id);
	}

	/**
	 * 新增商品進購物車
	 * 
	 * @param id
	 * @param session
	 * @return
	 */
	@GetMapping("/addToCart")
	@ResponseBody
	public String addToCart(@RequestParam Integer id, HttpSession session,
			@RequestParam(required = false) Integer quantity) {
		// 先取得會員和商品id
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		if (member == null) {
			return "請先登入";
		}
		Product product = productService.findById(id);
		Integer memberId = member.getId();

		// 查詢購物車項目是否有重複（判斷方式為是不是空的）
		boolean flag = shoppingCartItemService.itemEmpty(memberId, id);

		// 如果不是空的
		if (flag == false) {
			// 先查詢是哪個用戶的哪個商品
			ShoppingCartItem shoppingCartItem = shoppingCartItemService.findByMemberIdAndProductId(memberId, id);
			// 然後把數量加1再保存
			if (quantity == null) {
				shoppingCartItem.setCount(shoppingCartItem.getCount() + 1);
				shoppingCartItemService.addToCart(shoppingCartItem);
				return "商品已存在，數量加1";
			}
			if (quantity > 0) {
				shoppingCartItem.setCount(shoppingCartItem.getCount() + quantity);
				shoppingCartItemService.addToCart(shoppingCartItem);
				return "商品已存在，數量加" + quantity;
			}
		}
		// 如果是空的
		if (flag == true) {
			ShoppingCartItem shoppingCartItem = new ShoppingCartItem();
			shoppingCartItem.setCount(1);
			shoppingCartItem.setMemberTest(member);
			shoppingCartItem.setProduct(product);
			shoppingCartItemService.addToCart(shoppingCartItem);
			return "商品添加成功";
		}

		// 如果都不是
		return "unexpect wrong please contact with engineer";
	}

	/**
	 * 刪除購物車商品
	 * 
	 * @param sciId
	 * @param session
	 * @return
	 */
	@GetMapping("/deleteShoppingCart")
	@ResponseBody
	public List<ShoppingCartItem> deleteShoppingCart(@RequestParam Integer sciId, HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		shoppingCartItemService.deleteShoppingCartItem(sciId);
		return shoppingCartItemService.findAllByMemberId(member.getId());
	}

	/**
	 * 點擊確認結帳後送出到訂單確認頁面
	 * 
	 * @return
	 */
	@GetMapping("/sendCartToCheck")
	public String sendCartToCheck() {
		return "ordercheck";
	}

	@GetMapping("checkCartItem")
	@ResponseBody
	public List<ShoppingCartItem> checkCartItem(HttpSession session) {
		// 取得會員id
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		// 取得會員當前購物車商品
		List<ShoppingCartItem> items = shoppingCartItemService.findAllByMemberId(member.getId());
		return items;
	}

	/**
	 * 新增訂單
	 * 
	 * @param session
	 * @return
	 */
	@PostMapping("/checkedOrder")
	public String sendOrderToCheck(@RequestParam String mname, String mtel, String memail, String city, String area,
			String addrDetail, HttpSession session) {
		// 串接會員地址
		String address = city + area + addrDetail;
		// 取得會員id
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		// 取得會員當前購物車商品
		List<ShoppingCartItem> items = shoppingCartItemService.findAllByMemberId(member.getId());
		// 計算總金額
		double totalPrice = 0;
		int totalCount = 0;
		for (ShoppingCartItem item : items) {
			totalPrice += item.getProduct().getPrice();
			totalCount += item.getCount();
			item.getProduct().setSales(item.getCount());
			item.getProduct().setInventory(item.getProduct().getInventory() - item.getCount());
			shoppingCartItemService.addToCart(item);
		}

		// 生成訂單
		OrderBean orderBean = new OrderBean();
		// 設定訂單編號
		orderBean.setId(new Date().hashCode());
		// 設定總數量
		orderBean.setCount(totalCount);
		// 設定總金額
		orderBean.setPrice(totalPrice);
		// 設定訂單所屬人
		orderBean.setMemberId(member.getId());
		// 設定收件人
		orderBean.setName(mname);
		// 設定收件人電話
		orderBean.setTel(mtel);
		// 設定收件人email
		orderBean.setMail(memail);
		// 設定收件人地址
		orderBean.setAddr(address);
		// 設定訂單項目
		List<OrderItems> oiList = new ArrayList<OrderItems>();
		for (ShoppingCartItem item : items) {
			// 創建訂單項目
			OrderItems orderItem = new OrderItems();
			orderItem.setCount(item.getCount());
			orderItem.setTotalPrice(item.getCount() * item.getProduct().getPrice());
			orderItem.setProduct(item.getProduct());
			orderItem.setOrderBean(orderBean);
			oiList.add(orderItem);
		}
		orderBean.setOrderItems(oiList);
		orderBeanService.save(orderBean);
		// 清空購物車
		shoppingCartItemService.deleteAll(items);
		return "redirect:/toMyOrderPage";
	}

	@GetMapping("/toMyOrderPage")
	public String toMyOrderPage(HttpSession session) {
		try {
			//取得document
			Document document = Jsoup.connect("https://rate.bot.com.tw/xrt?Lang=zh-TW").get();
			//取得tbody
			Elements tbody = document.getElementsByTag("tbody");
			//取得tbody裡面的tr
			Elements tr = tbody.select("tr");
			Object[] trArray = tr.toArray();
			String rmbLine =trArray[18].toString();
			int positionStart = rmbLine.indexOf("<td data-table=\"本行現金賣出\" class=\"rate-content-cash text-right print_hide\">");
			int positionEnd = rmbLine.indexOf("<td data-table=\"本行即期買入");
			String fx = rmbLine.substring(positionStart + 72, positionEnd - 8);
			session.setAttribute("fx", fx);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "myorderpage";
	}

	/**
	 * 調整購物車數量
	 * 
	 * @param count
	 * @param id
	 * @param session
	 * @return
	 */
	@GetMapping("/changeCartItem")
	@ResponseBody
	public List<ShoppingCartItem> changeCartItem(@RequestParam Integer count, Integer id, HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		ShoppingCartItem items = shoppingCartItemService.findByMemberIdAndProductId(member.getId(), id);
		Product p = items.getProduct();
		if (count > p.getInventory()) {
			count = p.getInventory();
		}
		items.setCount(count);
		shoppingCartItemService.addToCart(items);
		return shoppingCartItemService.findAllByMemberId(member.getId());
	}

	@GetMapping("/openMyOrder")
	@ResponseBody
	public List<OrderBean> openMyOrder(HttpSession session) {
		MemberTest member = (MemberTest) session.getAttribute("loginUser");
		return orderBeanService.findByMemberId(member.getId());
	}

	@GetMapping("/openMyOrderDetail")
	@ResponseBody
	public List<OrderItems> openMyOrderDetail(@RequestParam Integer orderId) {
		return orderItemService.findAllByOrderId(orderId);
	}

	@GetMapping("/mutipleConditionsQuery")
	@ResponseBody
	public List<Product> mutipleConditionsQuery(@RequestParam Integer[] typeCondi, Integer[] labelCondi) {
		return productService.findByTypeAndLabel(typeCondi, labelCondi);
	}

	@GetMapping("openProductDetail")
	public String openProductDetail(@RequestParam Integer productId, Model model) {
		Product product = productService.findById(productId);
		List<Product> pList = new ArrayList<Product>();
		pList.add(product);
		model.addAttribute("product", pList);
		return "productdetail";
	}

}
