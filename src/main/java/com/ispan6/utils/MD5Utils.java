package com.ispan6.utils;

import java.util.UUID;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Component;

@Component
public class MD5Utils {
	public String md5Encryption(String password) {
		String algoirthmName="MD5";
		String salt="dating6666";
		int hashIterations=1024;
		SimpleHash simpleHash= new SimpleHash(algoirthmName, password, salt, hashIterations);
		return  simpleHash+"";
	}

}
