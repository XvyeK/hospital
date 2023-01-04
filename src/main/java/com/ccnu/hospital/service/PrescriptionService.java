package com.ccnu.hospital.service;

import com.ccnu.hospital.entity.ResultInfo;

public interface PrescriptionService {
    ResultInfo list(String name);
    ResultInfo insert();
    ResultInfo delete();
    ResultInfo edit();
}
