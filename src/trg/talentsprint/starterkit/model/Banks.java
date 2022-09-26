package trg.talentsprint.starterkit.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="banks")
public class Banks {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String country;
	private long buyCash;
	private long sellCash;
	private long buyNonCash;
	private long sellNonCash;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public long getBuyCash() {
		return buyCash;
	}
	public void setBuyCash(long buyCash) {
		this.buyCash = buyCash;
	}
	public long getSellCash() {
		return sellCash;
	}
	public void setSellCash(long sellCash) {
		this.sellCash = sellCash;
	}
	public long getBuyNonCash() {
		return buyNonCash;
	}
	public void setBuyNonCash(long buyNonCash) {
		this.buyNonCash = buyNonCash;
	}
	public long getSellNonCash() {
		return sellNonCash;
	}
	public void setSellNonCash(long sellNonCash) {
		this.sellNonCash = sellNonCash;
	}
	public Banks(int id, String name, String country, long buyCash, long sellCash, long buyNonCash, long sellNonCash) {
		super();
		this.id = id;
		this.name = name;
		this.country = country;
		this.buyCash = buyCash;
		this.sellCash = sellCash;
		this.buyNonCash = buyNonCash;
		this.sellNonCash = sellNonCash;
	}
	public Banks() {
		super();
	}
	
}
