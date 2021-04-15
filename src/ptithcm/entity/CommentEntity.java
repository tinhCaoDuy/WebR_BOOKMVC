package poly.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Comment")
public class CommentEntity {
	@Id
	@GeneratedValue
	@Column(name="ID")
	private int id;
	
	@Column(name="Comment")
	private String comment;
	
	@ManyToOne
	@JoinColumn(name = "BookID")
	private BookEntity sach ;
	
	@ManyToOne
	@JoinColumn(name = "ClientID")
	private ClientEntity client;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public BookEntity getSach() {
		return sach;
	}

	public void setSach(BookEntity sach) {
		this.sach = sach;
	}

	public ClientEntity getClient() {
		return client;
	}

	public void setClient(ClientEntity client) {
		this.client = client;
	}
	
	
}
