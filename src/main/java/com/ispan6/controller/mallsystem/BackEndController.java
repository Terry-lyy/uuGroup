package com.ispan6.controller.mallsystem;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ispan6.bean.mallsystem.OrderBean;
import com.ispan6.bean.mallsystem.OrderItems;
import com.ispan6.bean.mallsystem.Product;
import com.ispan6.bean.mallsystem.ProductLabel;
import com.ispan6.bean.mallsystem.ProductType;
import com.ispan6.bean.membersystem.MemberTest;
import com.ispan6.service.mallsystem.OrderBeanService;
import com.ispan6.service.mallsystem.OrderItemService;
import com.ispan6.service.mallsystem.ProductLabelService;
import com.ispan6.service.mallsystem.ProductService;
import com.ispan6.service.mallsystem.ProductTypeService;

@Controller
public class BackEndController {

	@Autowired
	private ProductService productService;
	@Autowired
	private ProductLabelService productLabelService;
	@Autowired
	private ProductTypeService productTypeService;
	@Autowired
	private OrderBeanService orderBeanService;
	@Autowired
	private OrderItemService orderItemService;

	/**
	 * 商品管理頁面的所有資料輸出
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping("/backendProduct")
	@ResponseBody
	public List<Product> backEndSet() {
		return productService.getAllProduct();
	}

	/**
	 * 進入按鈕為productbackend2.jsp的刪除按鈕 根據id刪除商品
	 * 
	 * @param id
	 * @return 現在有個問題！商品在購物車裡刪不掉
	 */
	@GetMapping("/deleteProduct")
	@ResponseBody
	public String deleteProduct(@RequestParam Integer id) {
		List<OrderItems> ois = orderItemService.findByProductId(id);
		if (ois.size() != 0) {
			return "此商品有人下單，暫時無法刪除";
		}
		productService.deleteProduct(id);
		return "刪除成功";
	}

	/**
	 * 進入按鈕為productbackend2.jsp的編輯按鈕 點擊後會跳轉編輯網頁
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@GetMapping("/updataProduct")
	public String updateProduct(@RequestParam Integer id, Model model) {
		List<Product> aL = new ArrayList<Product>();
		Product product = productService.findById(id);
		aL.add(product);
		model.addAttribute("product", aL);
		return "updateproduct";
	}

	/**
	 * 進入按鈕為updateproduct.jsp的送出鍵 根據id進行修改和新增，編輯完成和新增商品預計都使用這個功能
	 * 
	 * @param product
	 * @return
	 */
	@PostMapping("saveProduct")
	public String saveProduct(Product product) {
		productService.insertProduct(product);
		return "redirect:/productbackend";
	}

	@GetMapping("/changeStatus")
	@ResponseBody
	public List<Product> changeStatus(@RequestParam Integer id) {
		Product product = productService.findById(id);
		System.out.println(product.getStatus());
		if (product.getStatus() == 0) {
			product.setStatus(1);
			productService.insertProduct(product);
		} else {
			product.setStatus(0);
			productService.insertProduct(product);
		}
		return productService.getAllProduct();
	}

	@GetMapping("/insertproduct")
	public String insertproduct() {
		return "insertproduct";
	}

	@GetMapping("/mutipleUpdate")
	@ResponseBody
	public List<Product> mutipleUpdate(@RequestParam Integer type, Integer label, Integer status, Integer[] target,Double discountNumber) {
		System.out.println(discountNumber);
		ArrayList aL = new ArrayList();
		for (int i = 0; i < target.length; i++) {
			Product productBefore = productService.findById(target[i]);
			if (type != 0) {
				productBefore.setType(type);
			}
			if (label != 0) {
				productBefore.setLabel(label);
			}
			if (status != 3) {
				productBefore.setStatus(status);
			}
			if (discountNumber != 0) {
				double price = productBefore.getPrice() * discountNumber;
				productBefore.setPrice(price);
			}
			productService.insertProduct(productBefore);
			Product productAfter = productService.findById(target[i]);
			aL.add(productAfter);
		}
		return aL;
	}

	@GetMapping("/order")
	public String goToOrderBackend() {
		return "orderbackend";
	}

	@GetMapping("/openBackendOrder")
	@ResponseBody
	public List<OrderBean> openMyOrder() {
		return orderBeanService.findAll();
	}

	@GetMapping("/searchOrderById")
	@ResponseBody
	public OrderBean searchOrderById(Integer orderId) {
		return orderBeanService.findById(orderId);
	}

	@GetMapping("/updateOrder")
	@ResponseBody
	public String updateOrder(OrderBean orderBean) {
		OrderBean target = orderBeanService.findById(orderBean.getId());
		target.setAddr(orderBean.getAddr());
		target.setPrice(orderBean.getPrice());
		target.setName(orderBean.getName());
		target.setTel(orderBean.getTel());
		orderBeanService.save(target);
		return "修改成功";
	}
	
	@GetMapping("/deleteOrder")
	public void deleteOrder(Integer id) {
		orderBeanService.deleteById(id);
	}
	
	@GetMapping("/sortByDate")
	@ResponseBody
	public List<OrderBean> sortByDate(){
		return orderBeanService.sortAllByDate();
	}
	
	@GetMapping("/sortByName")
	@ResponseBody
	public List<OrderBean> sortByName(){
		return orderBeanService.sortAllByName();
	}
	
	@GetMapping("/sortByStatus")
	@ResponseBody
	public List<OrderBean> sortByStatus(){
		return orderBeanService.sortAllByStatus();
	}
	
	@GetMapping("/changeOrderStatus")
	@ResponseBody
	public List<OrderBean> updateOrder(Integer[] targets) {
		List<OrderBean> aL = new ArrayList<OrderBean>();
		for(int i = 0 ; i < targets.length ; i++) {
			OrderBean target = orderBeanService.findById(targets[i]);
			target.setStatus(2);
			orderBeanService.save(target);
			aL.add(target);
		}
		return aL;
	}
	
	@PostMapping("/CSVReader")
	public String readCSV(@RequestParam("file") MultipartFile file) {
        try (
                InputStream inputStream = file.getInputStream();
                BufferedReader br = new BufferedReader(new InputStreamReader(inputStream))
            ) {
                String line;
                br.readLine();
                while ((line = br.readLine()) != null) {
                    String[] fields = line.split(",");
                    productService.insertCSV(fields);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
		return "productbackend2";
	}
}
