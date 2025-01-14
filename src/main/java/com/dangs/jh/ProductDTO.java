package com.dangs.jh;
import java.sql.Date;

import com.google.gson.Gson;

public class ProductDTO {
	private String product_id;
	private String product_seller;
	private String product_name;
	private int product_price;
	private int product_stock;
	private String product_category;
	private String product_img;
	private Date product_date;
	private String sub_category;
	
	public ProductDTO() {
		
	}

	public ProductDTO(String product_id, String product_seller, String product_name, int product_price,
			int product_stock, String product_category, String product_img, Date product_date, String sub_category) {
		super();
		this.product_id = product_id;
		this.product_seller = product_seller;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_stock = product_stock;
		this.product_category = product_category;
		this.product_img = product_img;
		this.product_date = product_date;
		this.sub_category = sub_category;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getProduct_seller() {
		return product_seller;
	}

	public void setProduct_seller(String product_seller) {
		this.product_seller = product_seller;
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

	public int getProduct_stock() {
		return product_stock;
	}

	public void setProduct_stock(int product_stock) {
		this.product_stock = product_stock;
	}

	public String getProduct_category() {
		return product_category;
	}

	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}

	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}

	public Date getProduct_date() {
		return product_date;
	}

	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}

	public String getSub_category() {
		return sub_category;
	}

	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}

	@Override
	public String toString() {
		return "ProductDTO [product_id=" + product_id + ", product_seller=" + product_seller + ", product_name="
				+ product_name + ", product_price=" + product_price + ", product_stock=" + product_stock
				+ ", product_category=" + product_category + ", product_img=" + product_img + ", product_date="
				+ product_date + ", sub_category=" + sub_category + "]";
	}
	
	public String toJSON() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}
	
}
