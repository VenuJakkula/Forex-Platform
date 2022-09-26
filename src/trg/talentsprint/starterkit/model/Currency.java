package trg.talentsprint.starterkit.model;

import java.util.Date;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "currency")
public class Currency {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String country;
	private String currency_name;
	private float currency_value;
	private Date date_of_rec;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCurrency_name() {
		return currency_name;
	}
	public void setCurrency_name(String currency_name) {
		this.currency_name = currency_name;
	}
	public float getCurrency_value() {
		return currency_value;
	}
	public void setCurrency_value(float currency_value) {
		this.currency_value = currency_value;
	}
	public Date getDate_of_rec() {
		return date_of_rec;
	}
	public void setDate_of_rec(Date date_of_rec) {
		this.date_of_rec = date_of_rec;
	}
	public Currency(int id, String country, String currency_name, float currency_value, Date date_of_rec) {
		super();
		this.id = id;
		this.country = country;
		this.currency_name = currency_name;
		this.currency_value = currency_value;
		this.date_of_rec = date_of_rec;
	}
	
	public Currency() {
		
	}

}
