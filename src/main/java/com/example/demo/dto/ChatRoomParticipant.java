package com.example.demo.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoomParticipant {
	private int id;             // 참여자 ID
    private String roomId;     // 채팅방 ID
    private int memberId;           
}
