package com.example.demo.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Matching {
    private int id;                      // 매칭 ID
    private String regDate;              // 생성일
    private String updateDate;           // 수정일
    private int hostTeamId;              // 주최 팀 ID
    private Integer guestTeamId;         // 상대 팀 ID (null 허용)
    private int createdBy;               // 매칭 생성자 ID
    private String matchDate;            // 매칭 날짜 및 시간
    private String region;               // 지역 정보
    private String stadium;              // 구장 정보
    private String playerCount;          // 경기 인원
    private String gender;               // 성별 (MALE, FEMALE, MIXED)
    private String status;               // 상태 (WAITING, MATCHED, COMPLETED, CANCELLED)
    private String description;          // 기타 정보
    private String name;
    private LocalDateTime createdDate;
    private int matchCount;
}

