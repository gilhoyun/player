package com.example.demo.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ArticleDao;
import com.example.demo.dao.MemberDao;
import com.example.demo.dto.Article;
import com.example.demo.dto.Member;


@Service
public class MemberService {
	
	private MemberDao memberDao;
	
	public MemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	public void joinMember(String loginId, String loginPw, String name, byte[] profileImage) {
	    memberDao.joinMember(loginId, loginPw, name, profileImage);
	}
	public Member getMemberByLoginId(String loginId) {
		return memberDao.getMemberByLoginId(loginId);
	}
	public Member getMemberById(int id) {
		return memberDao.getMemberById(id);
	}
	public int getLastInsertId() {
		return memberDao.getLastInsertId();
	}
	public void modifyPassword(int loginedMemberId, String loginPw) {
		memberDao.modifyPassword(loginedMemberId, loginPw);
	}
}
