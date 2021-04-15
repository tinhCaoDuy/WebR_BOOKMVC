package poly.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Category")
public class CategoryEntity {
	@Id
	@GeneratedValue
	@Column(name="CategoryID")
	private int categoryid;
	
	@Column(name="Name")
	private String name;
	
	@OneToMany(mappedBy="loaisach", fetch=FetchType.EAGER)
	private Collection<BookEntity> sachs;

	public int getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Collection<BookEntity> getSachs() {
		return sachs;
	}

	public void setSachs(Collection<BookEntity> sachs) {
		this.sachs = sachs;
	}

	

	
	
	


	
	
}
