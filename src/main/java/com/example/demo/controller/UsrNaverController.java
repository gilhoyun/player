package com.example.demo.controller;

import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.example.demo.dto.Member;
import com.example.demo.dto.Rq;
import com.example.demo.service.MemberService;
import com.example.demo.util.Util;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsrNaverController {

    private final MemberService memberService;

    @Value("${naver.client_id}")
    private String client_id;

    @Value("${naver.client_secret}")
    private String client_secret;

    @Value("${naver.redirect_uri}")
    private String redirect_uri;

    public UsrNaverController(MemberService memberService) {
        this.memberService = memberService;
    }

    @GetMapping("/usr/naver/login")
    public String showLogin(HttpServletRequest req) {
        // 상태 값 생성
        String state = UUID.randomUUID().toString();
        HttpSession session = req.getSession();
        session.setAttribute("oauth_state", state); // 세션에 저장

        // Naver 인증 URL 생성
        String naverAuthUrl = "https://nid.naver.com/oauth2.0/authorize"
                + "?response_type=code"
                + "&client_id=" + client_id
                + "&redirect_uri=" + redirect_uri
                + "&state=" + state;

        return "redirect:" + naverAuthUrl;
    }

    @GetMapping("/usr/naver/callback")
    @ResponseBody
    public String naverCallback(@RequestParam("code") String code,
                                 @RequestParam("state") String state,
                                 HttpServletRequest req) {
        HttpSession session = req.getSession();
        String sessionState = (String) session.getAttribute("oauth_state");

        // state 검증
        if (sessionState == null || !sessionState.equals(state)) {
            return Util.jsReturn("잘못된 접근입니다. 다시 시도해주세요.", "/usr/member/login");
        }

        // 세션에서 상태값 제거
        session.removeAttribute("oauth_state");

        // 네이버 OAuth2 인증 코드로 액세스 토큰 요청
        String tokenUrl = "https://nid.naver.com/oauth2.0/token";

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/x-www-form-urlencoded");

        String body = "grant_type=authorization_code"
                + "&client_id=" + client_id
                + "&client_secret=" + client_secret
                + "&redirect_uri=" + redirect_uri
                + "&code=" + code
                + "&state=" + state;

        HttpEntity<String> entity = new HttpEntity<>(body, headers);
        RestTemplate restTemplate = new RestTemplate();

        try {
            ResponseEntity<String> response = restTemplate.exchange(tokenUrl, HttpMethod.POST, entity, String.class);
            String accessToken = parseAccessToken(response.getBody());
            return processNaverUser(accessToken, req);
        } catch (Exception e) {
            e.printStackTrace();
            return Util.jsReturn("네이버 인증에 실패했습니다. 다시 시도해주세요.", "/usr/member/login");
        }
    }

    private String parseAccessToken(String responseBody) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(responseBody);
            return jsonNode.get("access_token").asText();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private String processNaverUser(String accessToken, HttpServletRequest req) {
        String userInfoUrl = "https://openapi.naver.com/v1/nid/me";

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);

        HttpEntity<String> entity = new HttpEntity<>(headers);
        RestTemplate restTemplate = new RestTemplate();

        try {
            ResponseEntity<String> response = restTemplate.exchange(userInfoUrl, HttpMethod.GET, entity, String.class);
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(response.getBody());
            JsonNode responseNode = jsonNode.get("response");

            String email = responseNode.get("email").asText();
            String name = responseNode.get("name").asText();
            String profileImage = responseNode.get("profile_image").asText();

            // ID를 이메일의 @ 전까지로 설정
            String loginId = email.split("@")[0];

            // 회원 여부 확인
            Member existingMember = memberService.getMemberByLoginId(loginId);
            if (existingMember != null) {
                // 로그인 처리
                Rq rq = (Rq) req.getAttribute("rq");
                rq.login(existingMember.getId());
                return Util.jsReturn(String.format("%s님 환영합니다~", existingMember.getName()), "/");
            }

            // 새로 가입 처리
            String loginPw = Util.encryptSHA256(UUID.randomUUID().toString());
            byte[] profileImageData = downloadImage(profileImage);

            memberService.joinMember(loginId, loginPw, name, email, profileImageData);

            // 가입 후 로그인 처리
            Member newMember = memberService.getMemberByLoginId(loginId);
            Rq rq = (Rq) req.getAttribute("rq");
            rq.login(newMember.getId());

            return Util.jsReturn(String.format("%s님 환영합니다~", newMember.getName()), "/");

        } catch (Exception e) {
            e.printStackTrace();
            return Util.jsReturn("사용자 정보를 가져오지 못했습니다. 다시 시도해주세요.", "/usr/member/login");
        }
    }

    private byte[] downloadImage(String imageUrl) throws IOException {
        RestTemplate restTemplate = new RestTemplate();
        return restTemplate.getForObject(imageUrl, byte[].class);
    }
}
