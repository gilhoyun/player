package com.example.demo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Team {
	private int id;
	private String teamName;
	private String region;
	private String slogan;
	private byte[] teamImage;
	private int createdBy;
	private String regDate;
	private String updateDate;
}
