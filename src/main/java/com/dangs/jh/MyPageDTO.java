package com.dangs.jh;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyPageDTO {
	private String order_id;
	private String order_user;
	private String order_product;
	private int order_price;
	private String order_address;
	private Date order_date;
	private String order_status;
	private String order_tel;
	private String order_request;
	private int order_stock;
	private String order_bank;
	private String order_installments;
	private String product_img;
	private String product_name;
	private String user_id;
}
