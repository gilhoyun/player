package com.example.demo.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.ResultData;

@Controller
public class UsrHomeController {

    @GetMapping("/usr/home/main")
    public String showMain() {
        return "usr/home/main";
    }

    @GetMapping("/")
    public String showRoot() {
        return "redirect:/usr/home/main";
    }

    @GetMapping("/usr/home/test")
    @ResponseBody
    public ResultData<Map<String, Object>> test(String key1, String key2) {
        Map<String, Object> map = new HashMap<>();
        map.put("key1", key1);
        map.put("key2", key2);

        return ResultData.from("code", key1 + key2, map);
    }

    @GetMapping("/usr/home/publicData")
    public String publicDataPage(Model model) {
        return "usr/home/publicData";
    }

    @GetMapping("/usr/home/apiCall")
    @ResponseBody
    public String callPublicApi() {
        try {
            StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088");
            /* URL */
            urlBuilder.append("/" + URLEncoder.encode("6779454974676f6834334550777359", "UTF-8")); /* 인증키 */
            urlBuilder.append("/" + URLEncoder.encode("json", "UTF-8")); /* 요청파일타입 (xml, xmlf, xls, json) */
            urlBuilder.append("/" + URLEncoder.encode("ListPublicReservationSport", "UTF-8")); /* 서비스명 */
            urlBuilder.append("/" + URLEncoder.encode("1", "UTF-8")); /* 요청시작위치 */
            urlBuilder.append("/" + URLEncoder.encode("1", "UTF-8")); /* 요청종료위치 */
            urlBuilder.append("/" + URLEncoder.encode("풋살장", "UTF-8"));
 
            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json"); // JSON 요청
            System.out.println("Response code: " + conn.getResponseCode()); /* 연결 상태 확인 */

            BufferedReader rd;
            // 응답 코드 확인
            if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), StandardCharsets.UTF_8));
            }
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            rd.close();
            conn.disconnect();
            System.out.println(sb.toString());
            return sb.toString(); // API 호출 결과 반환
        } catch (Exception e) {
            e.printStackTrace();
            return "API 호출 중 오류가 발생했습니다: " + e.getMessage(); // 오류 메시지 반환
        }
    }
}