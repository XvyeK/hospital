package com.ccnu.hospital.service;

import com.ccnu.hospital.entity.ResultInfo;

public interface AdminService {
    ResultInfo list(String email, String nickName, String name, String phoneNum);
    ResultInfo listNew(String email, String nickName, String name);
    ResultInfo insert();
    ResultInfo delete();
    ResultInfo edit();
}
