package com.example.demo.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Chat;
import com.example.demo.dto.ChatRoom;
import com.example.demo.service.ChatService;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Controller
public class UsrChatController {

    private final ChatService chatService;
    private final SimpMessagingTemplate messagingTemplate;

    public UsrChatController(ChatService chatService, SimpMessagingTemplate messagingTemplate) {
        this.chatService = chatService;
        this.messagingTemplate = messagingTemplate;
    }
    
    @GetMapping("/usr/chat/chatting")
    public String chatting(Model model) {
      
        return "usr/chat/chatting";
    }

    // Display chat rooms page
    @GetMapping("/usr/chat/rooms")
    public String chatRooms(Model model) {
        List<ChatRoom> rooms = chatService.findAllChatRooms();
        model.addAttribute("rooms", rooms);
        return "usr/chat/rooms";
    }

    // Create a new chat room
    @PostMapping("/usr/chat/rooms")
    @ResponseBody
    public ChatRoom createChatRoom(@RequestBody ChatRoom chatRoom) {
        chatRoom.setRoomId(UUID.randomUUID().toString());
        chatRoom.setCreatedAt(LocalDateTime.now());
        return chatService.createChatRoom(chatRoom);
    }

    // Enter a specific chat room
    @GetMapping("/usr/chat/room/{roomId}")
    public String enterChatRoom(@PathVariable String roomId, Model model) {
        ChatRoom room = chatService.findChatRoomById(roomId);
        List<Chat> chatHistory = chatService.getChatHistory(roomId);
        
        model.addAttribute("room", room);
        model.addAttribute("chatHistory", chatHistory);
        
        return "usr/chat/chatting";
    }

    // WebSocket endpoint for sending messages
    @MessageMapping("/chat/send")
    @SendTo("/sub/chat/{roomId}")
    public Chat sendMessage(Chat chat) {
        chat.setTimestamp(LocalDateTime.now());
        chat.setRead(false);
        
        // Save message to database
        chatService.saveMessage(chat);
        
        return chat;
    }
    
}