package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.dao.KakaoDao;

@Service
public class KakaoService {
      
    private KakaoDao kakaoDao;
    
    public KakaoService(KakaoDao kakaoDao) {
        this.kakaoDao = kakaoDao;
    }
    
  
}
