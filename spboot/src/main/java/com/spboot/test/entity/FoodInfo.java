package com.spboot.test.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import lombok.Data;

@Entity
@Table(name="food_info")
@Data
@DynamicInsert
@DynamicUpdate
public class FoodInfo {
	
	@SequenceGenerator(allocationSize = 1, name = "seqFiNum",sequenceName = "seq_fi_num")
	@GeneratedValue(generator = "seqFiNum",strategy = GenerationType.SEQUENCE)
	@Id
	@Column(name="fi_num")
	private Integer fiNum;
	@Column(name="fi_name")
	private String fiName;
	@Column(name="fi_price")
	@ColumnDefault("0")
	private Integer fiPrice;
	@Column(name="fi_type")
	private String fiType;
	@Column(name="fi_desc")
	private String fiDesc;
	@Column(name="credat")
	@ColumnDefault("sysdate")	
	private Date credat;
	@Column(name="active")
	@ColumnDefault("0")
	private String active;
}
