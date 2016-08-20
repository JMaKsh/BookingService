package com.gmail.maxgorinshteyn.YahooFinanceRate;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "query")
public class Query {
    @XmlElement(name = "results")
    private Results results;

    public Results getResults() {
        return results;
    }

    @Override
    public String toString() {
        return results.toString();
    }
}
