package com.icarte.module.login.service;

import com.icarte.dto.LoginResponseDTO;
import com.icarte.dto.RequestDTO;
import com.icarte.dto.ResponseDTO;

public interface DeviceLoginService {

	ResponseDTO<LoginResponseDTO> loginDevice(RequestDTO request);
}
