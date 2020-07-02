/*
	@author:Quang Truong
	@date: Jan 15, 2020
*/

package online.newbrandshop.modal;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "product")
public class ProductEntity extends BaseEntity{
	@JsonIgnore
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "product_category", joinColumns = @JoinColumn(name = "productid"),
			inverseJoinColumns = @JoinColumn(name = "categoryid"))
	private List<CategoryEntity> listCategories = new ArrayList<>();

	@Column(name = "name")
	private String name;

	@Column(name = "image")
	private String url1;

	@Column(name = "price")
	private String price;

	@Column(name = "sold")
	private int sold;

	@Column(name = "content")
	String content;
	@Column(name = "active")
	int active;
	@Column(name = "size")
	String size;
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public List<CategoryEntity> getListCategories() {
		return listCategories;
	}

	public void setListCategories(List<CategoryEntity> listCategories) {
		this.listCategories = listCategories;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUrl1() {
		return url1;
	}

	public void setUrl1(String url1) {
		this.url1 = url1;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getSold() {
		return sold;
	}

	public void setSold(int sold) {
		this.sold = sold;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
