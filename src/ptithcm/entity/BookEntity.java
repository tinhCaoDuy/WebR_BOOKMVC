package poly.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Book")
public class BookEntity {
	@Id
	@GeneratedValue
	@Column(name="BookID")	
	private int bookid;
	
	@Column(name="Title")
	private String title;
	
	@Column(name="Image")
	private String image;
	
	@Column(name="Author")
	private String author;
	
	@Column(name="Description")
	private String description;
	
	@ManyToOne
	@JoinColumn(name = "CategoryID")
	private CategoryEntity loaisach ;
	
	@OneToMany(mappedBy="sach", fetch=FetchType.EAGER)
	private Collection<CommentEntity> comments;

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public CategoryEntity getLoaisach() {
		return loaisach;
	}

	public void setLoaisach(CategoryEntity loaisach) {
		this.loaisach = loaisach;
	}	

	public Collection<CommentEntity> getComments() {
		return comments;
	}

	public void setComments(Collection<CommentEntity> comments) {
		this.comments = comments;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
	
	
}
