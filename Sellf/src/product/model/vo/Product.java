package product.model.vo;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONObject;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class Product {
	private int product_entire_pk;
	private String product_entire_user_entire_id_fk;
	private String product_entire_category_main_id_fk;
	private String product_entire_category_sub_id_fk;
	private String product_name;
	private int product_price;
	private String product_image;
	private int product_amount;
	private String product_state;
	private String product_detail;
	private String product_oldnew;
	private JsonObject jsonObject = new JsonObject();
	private JsonObject detailObject = new JsonObject();
	
	
	public String getProduct_oldnew() {
		return product_oldnew;
	}
	public void setProduct_oldnew(String product_oldnew) {
		this.product_oldnew = product_oldnew;
	}
	public int getProduct_entire_pk() {
		return product_entire_pk;
	}
	public void setProduct_entire_pk(int product_entire_pk) {
		this.product_entire_pk = product_entire_pk;
	}
	public String getProduct_entire_user_entire_id_fk() {
		return product_entire_user_entire_id_fk;
	}
	public void setProduct_entire_user_entire_id_fk(String product_entire_user_entire_id_fk) {
		this.product_entire_user_entire_id_fk = product_entire_user_entire_id_fk;
	}
	public String getProduct_entire_category_main_id_fk() {
		return product_entire_category_main_id_fk;
	}
	public void setProduct_entire_category_main_id_fk(String product_entire_category_main_id_fk) {
		this.product_entire_category_main_id_fk = product_entire_category_main_id_fk;
	}
	public String getProduct_entire_category_sub_id_fk() {
		return product_entire_category_sub_id_fk;
	}
	public void setProduct_entire_category_sub_id_fk(String product_entire_category_sub_id_fk) {
		this.product_entire_category_sub_id_fk = product_entire_category_sub_id_fk;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getProduct_amount() {
		return product_amount;
	}
	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}
	
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
//		System.out.println(product_entire_pk + " 이미지 경로 " + this.product_image);
//		if(this.product_image!=null && this.product_image.length()>0) {
			jsonObject = new JsonParser().parse(this.product_image).getAsJsonObject();
//		}
//		System.out.println(jsonObject.get("name").getAsString());
	}
	
	public JsonObject getImageJson()
	{
		return jsonObject;
	}
	public String getProduct_state() {
		return product_state;
	}
	public void setProduct_state(String product_state) {
		this.product_state = product_state;
	}
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
//		System.out.println("상품 설명 json " + this.product_detail);
		detailObject = new JsonParser().parse(this.product_detail).getAsJsonObject();
	}
	public JsonObject getDetailJson()
	{
		return detailObject;
	}
	
	
}