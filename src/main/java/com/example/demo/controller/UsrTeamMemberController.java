package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.demo.service.TeamMemberService;

@Controller
public class UsrTeamMemberController {
    private final TeamMemberService teamMemberService;
    
    public UsrTeamMemberController(TeamMemberService teamMemberService) {
        this.teamMemberService = teamMemberService;
    }
    
    @GetMapping("/usr/teamMember/approve")
    public String approveTeamMembership( Integer teamMemberId) {
        teamMemberService.updateMembershipStatus(teamMemberId, "APPROVED");
        return "/usr/team/detail";
    }

    @GetMapping("/usr/teamMember/reject")
    public String rejectTeamMembership(Integer teamMemberId) {
        teamMemberService.updateMembershipStatus(teamMemberId, "REJECTED");
        return "/usr/team/detail";
    }
}