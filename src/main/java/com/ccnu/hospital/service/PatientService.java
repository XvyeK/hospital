package com.ccnu.hospital.service;

import com.ccnu.hospital.entity.ResultInfo;

public interface PatientService {
    ResultInfo list(String emailQuery, String nickName, String name);
    ResultInfo insert();
    ResultInfo delete();
    ResultInfo edit();

}
