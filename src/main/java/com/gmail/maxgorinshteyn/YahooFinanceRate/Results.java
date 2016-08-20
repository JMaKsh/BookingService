package com.gmail.maxgorinshteyn.YahooFinanceRate;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;
import java.util.List;

@XmlRootElement(name = "results")
public class Results {

    @XmlElement(name = "rate")
    private List<Rate> results = new ArrayList<>();

    public List<Rate> getResults() {
        return results;
    }

    public Results() {
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (Rate rate : results) {
            sb.append("Rate: id = ")
                    .append(rate.getId())
                    .append(" rate = ")
                    .append(rate.getRate())
                    .append("\n");
        }
        return sb.toString();
    }
}
