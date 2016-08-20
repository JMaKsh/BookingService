package com.gmail.maxgorinshteyn.DAO;

import com.gmail.maxgorinshteyn.Entities.Schedule;

import java.time.LocalDate;
import java.util.List;

public interface ScheduleDAO {
    List<Schedule> list(String from, String to, LocalDate date);
    Schedule findScheduleById(long id);
}
