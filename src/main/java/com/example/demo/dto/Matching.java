package com.example.demo.dto;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
    
    public String getDayOfWeek() {
        if (this.matchDate == null || this.matchDate.isEmpty()) {
            return null; // 날짜가 없는 경우 null 반환
        }
        try {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime dateTime = LocalDateTime.parse(this.matchDate, formatter);
            DayOfWeek dayOfWeek = dateTime.getDayOfWeek();
            // 요일을 한글로 반환
            switch (dayOfWeek) {
                case MONDAY:
                    return "월요일";
                case TUESDAY:
                    return "화요일";
                case WEDNESDAY:
                    return "수요일";
                case THURSDAY:
                    return "목요일";
                case FRIDAY:
                    return "금요일";
                case SATURDAY:
                    return "토요일";
                case SUNDAY:
                    return "일요일";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // 날짜 파싱 실패 시 null 반환
    }
    
    public String getGenderInKorean() {
        if (gender == null) {
            return "";
        }
        switch (gender) {
            case "MALE":
                return "남자 매치";
            case "FEMALE":
                return "여자 매치";
            case "MIXED":
                return "남녀 모두 매치";
            default:
                return "";
        }
    }
}

