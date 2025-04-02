package com.lighting.weather;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class WeatherDTO {
    private int locationCode;
    private String date;
    private String time;
    private double PTY;
    private double REH;
    private double RN1;
    private double T1H;
    private double UUU;
    private double VVV;
    private double VEC;
    private double WSD;
}
