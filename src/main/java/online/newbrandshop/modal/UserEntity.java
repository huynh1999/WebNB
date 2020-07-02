/*
	@author:Quang Truong
	@date: Jan 14, 2020
*/

package online.newbrandshop.modal;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user")
public class UserEntity extends BaseEntity {

	@Column(name = "username")
	private String userName;

	@Column(name = "password")
	private String password;

	@Column(name = "email")
	private String email;

	@Column(name = "active")
	private int active;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "roleuserid")
	private RoleUserEntity roleUserEntity;

	
	@OneToOne(mappedBy = "userEntity",cascade = {CascadeType.ALL})
	private ProfileUserEntity profileUserEntity;
	
	public ProfileUserEntity getProfileUserEntity() {
		return profileUserEntity;
	}

	public void setProfileUserEntity(ProfileUserEntity profileUserEntity) {
		this.profileUserEntity = profileUserEntity;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public RoleUserEntity getRoleUserEntity() {
		return roleUserEntity;
	}

	public void setRoleUserEntity(RoleUserEntity roleUserEntity) {
		this.roleUserEntity = roleUserEntity;
	}


	
}
