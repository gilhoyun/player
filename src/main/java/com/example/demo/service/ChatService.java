package com.example.demo.service;

import org.springframework.stereotype.Service;
import com.example.demo.dao.ChatDao;
import com.example.demo.dto.Chat;
import com.example.demo.dto.ChatRoom;
import java.util.List;

@Service
public class ChatService {
    
    private final ChatDao chatDao;
    
    public ChatService(ChatDao chatDao) {
        this.chatDao = chatDao;
    }
    
    public ChatRoom createChatRoom(ChatRoom chatRoom) {
        chatDao.insertChatRoom(chatRoom);
        return chatRoom;
    }
    
    public List<ChatRoom> findAllChatRooms() {
        return chatDao.selectAllChatRooms();
    }
    
    public ChatRoom findChatRoomById(String roomId) {
        return chatDao.selectChatRoomById(roomId);
    }
    
    public void saveMessage(Chat chat) {
        chatDao.insertMessage(chat);
    }
    
    public List<Chat> getChatHistory(String roomId) {
        return chatDao.selectChatHistory(roomId);
    }
}