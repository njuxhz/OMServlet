package com.om.user;

import java.io.Serializable;

public class User implements Serializable{
	
	public static final int DELIVER = 1;
	public static final int ENGINEER = 2;
	public static final int SALER = 3;
	public static final int ADMIN = 4;
			
	public String id;
	public int mode = 0;
	public String nickname, passwd;
	
	public User(String id, int mode, String passwd){
		this.id = id;
		this.mode = mode;
		this.passwd = passwd;
		getNickname();
	}
	
	public void getNickname() {
		// TODO Auto-generated method stub
		nickname = type() + id;
	}

	public String type(){
		String ret = null;
		switch(mode){
		case DELIVER:
			ret="�ɵ�Ա";break;
		case ENGINEER:
			ret="����ʦ";break;
		case SALER:
			ret="����Ա";break;
		case ADMIN:
			ret="����Ա";break;
		default: break;
		}
		return ret;
	}

	public int spinner(int mode2) {
		// TODO Auto-generated method stub
		if(mode2 == DELIVER) return 1;
		else if(mode2 == ENGINEER) return 2;
		else if(mode2 == SALER) return 3;
		else if(mode2 == ADMIN) return 4;
		return 0;
	}
}