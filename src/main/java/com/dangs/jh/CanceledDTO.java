package com.dangs.jh;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CanceledDTO {
	private String co_user;
	private String co_order;
	private String co_reason;
	private String co_bank;
	private String co_account;
	private String co_accountName;
	private Date co_date;
	private String co_status;
}
