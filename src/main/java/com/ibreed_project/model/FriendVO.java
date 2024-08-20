package com.ibreed_project.model;

import java.util.Date;

public class FriendVO {
	private int friend_id;
	private String requester_id;
    private String receiver_id;
    private Date requested_at;
    private Date response_at;
    private String request_status;
    
	public int getFriend_id() {
		return friend_id;
	}
	public void setFriend_id(int friend_id) {
		this.friend_id = friend_id;
	}
	public String getRequester_id() {
		return requester_id;
	}
	public void setRequester_id(String requester_id) {
		this.requester_id = requester_id;
	}
	public String getReceiver_id() {
		return receiver_id;
	}
	public void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}
	public Date getRequested_at() {
		return requested_at;
	}
	public void setRequested_at(Date requested_at) {
		this.requested_at = requested_at;
	}
	public Date getResponse_at() {
		return response_at;
	}
	public void setResponse_at(Date response_at) {
		this.response_at = response_at;
	}
	public String getRequest_status() {
		return request_status;
	}
	public void setRequest_status(String request_status) {
		this.request_status = request_status;
	}
    
    
}
