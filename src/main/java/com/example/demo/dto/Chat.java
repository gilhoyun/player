package com.example.demo.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Chat {
	private Long id;
    private String sender;
    private String content;
    private LocalDateTime timestamp;
    private String roomId;
    private boolean isRead;
    private String senderName; // Add this field for loginId
    private byte[] senderProfileImage; // Add this field for profile image
}
