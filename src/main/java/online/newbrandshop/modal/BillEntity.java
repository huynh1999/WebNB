/*
	@author:Quang Truong
	@date: Jan 15, 2020
*/

package online.newbrandshop.modal;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "bill")
public class BillEntity extends BaseEntity {

	@Column(name = "details")
	private String details;
	@Column(name = "content")
	private String content;
	@Column(name = "totalmoney")
	private String totalMoney;
	@Column(name = "status")
	private int status;

	public String getBillName() {
		return billName;
	}

	public void setBillName(String billName) {
		this.billName = billName;
	}

	@Column(name="billname")
	String billName;
	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@NotBlank
	@Column(name = "paymentmethod")
	private String paymentMethod;
	@JsonIgnore
	@OneToOne(mappedBy = "billEntity", cascade=CascadeType.ALL)
	private PayerEntity payerEntity;


	public String getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(String totalMoney) {
		this.totalMoney = totalMoney;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}


	public PayerEntity getPayerEntity() {
		return payerEntity;
	}

	public void setPayerEntity(PayerEntity payerEntity) {
		this.payerEntity = payerEntity;
	}

	
	
}
