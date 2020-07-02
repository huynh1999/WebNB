/*
	@author:Quang Truong
	@date: Jan 15, 2020
*/

package online.newbrandshop.modal;

import javax.persistence.*;
import java.util.Date;


@Entity
@Table(name = "profileuser")
public class ProfileUserEntity extends BaseEntity{

	@Column(name = "name")
	private String name;
	
	@Column(name = "address")
	private String address;
	
	@Column(name = "phonenumber")
	private String phonenumber;
	
	@OneToOne
    @JoinColumn(name = "userid", referencedColumnName = "id")
	private UserEntity userEntity;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}
	
	
}
