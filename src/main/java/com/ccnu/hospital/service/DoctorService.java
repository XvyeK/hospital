package com.ccnu.hospital.service;

import com.ccnu.hospital.entity.ResultInfo;

public interface DoctorService {
    ResultInfo list(String name, String phoneNum);
    ResultInfo insert();
    ResultInfo delete();
    ResultInfo edit();
}
