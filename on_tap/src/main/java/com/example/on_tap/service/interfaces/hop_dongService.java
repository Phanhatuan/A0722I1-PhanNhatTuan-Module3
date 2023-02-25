package com.example.on_tap.service.interfaces;

import java.sql.SQLException;
import java.util.List;

public interface hop_dongService {
    void insertHop_dong(hop_dongService hop_dong) throws SQLException;

    hop_dongService selectHop_dong(int id);

    List<hop_dongService> selectAllHop_dong();

    boolean deleteHop_dong(int id) throws SQLException;

    boolean updateHop_dong(hop_dongService hop_dong) throws SQLException;
}
