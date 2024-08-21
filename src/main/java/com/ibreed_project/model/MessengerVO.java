package com.ibreed_project.model;

import java.sql.Timestamp;

public class MessengerVO {
    private int msgId;
    private String msgSubject;
    private String msgContent;
    private Timestamp msgTimestamp;
    private boolean msgIsRead;
    private String senderId;
    private String senderNickname; // 추가된 필드
    private String receiverId;
    private String receiverNickname; // 추가된 필드

    // Getters and Setters
    public int getMsgId() { return msgId; }
    public void setMsgId(int msgId) { this.msgId = msgId; }
    public String getMsgSubject() { return msgSubject; }
    public void setMsgSubject(String msgSubject) { this.msgSubject = msgSubject; }
    public String getMsgContent() { return msgContent; }
    public void setMsgContent(String msgContent) { this.msgContent = msgContent; }
    public Timestamp getMsgTimestamp() { return msgTimestamp; }
    public void setMsgTimestamp(Timestamp msgTimestamp) { this.msgTimestamp = msgTimestamp; }
    public boolean isMsgIsRead() { return msgIsRead; }
    public void setMsgIsRead(boolean msgIsRead) { this.msgIsRead = msgIsRead; }
    public String getSenderId() { return senderId; }
    public void setSenderId(String senderId) { this.senderId = senderId; }
    public String getSenderNickname() { return senderNickname; }
    public void setSenderNickname(String senderNickname) { this.senderNickname = senderNickname; }
    public String getReceiverId() { return receiverId; }
    public void setReceiverId(String receiverId) { this.receiverId = receiverId; }
    public String getReceiverNickname() { return receiverNickname; }
    public void setReceiverNickname(String receiverNickname) { this.receiverNickname = receiverNickname; }
}
