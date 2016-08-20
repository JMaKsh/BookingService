package com.gmail.maxgorinshteyn.DAOImpl;

import com.gmail.maxgorinshteyn.DAO.RateDAO;
import com.gmail.maxgorinshteyn.Entities.Currency;
import com.gmail.maxgorinshteyn.YahooFinanceRate.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.net.MalformedURLException;
import java.net.URL;

@Repository
public class YahooRateDAOImpl implements RateDAO {

    private Query query;

    @PersistenceContext
    private EntityManager entityManager;


    @Override
    public void init() {
        String request = "http://query.yahooapis.com/v1/public/yql?format=xml&q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20in%20(%22EURUAH%22,%20%22USDUAH%22)&env=store://datatables.org/alltableswithkeys";
        JAXBContext jaxbContext = null;
        try {
            jaxbContext = JAXBContext.newInstance(Query.class);
            URL url = new URL(request);

            Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();
            query = (Query) unmarshaller.unmarshal(url);

            addRate();

        } catch (JAXBException e) {
            e.printStackTrace();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
    }


    public void addRate() {
        String nameUAH = "Hryvna";
        String codeUAH = "UAH";
        double rateUAH = 1.0;
        Currency currencyUAH = new Currency(nameUAH, codeUAH, rateUAH);

        String nameUSD = "Dollar";
        String codeUSD = "USD";
        double rateUSD = query.getResults().getResults().get(1).getRate();
        Currency currencyUSD = new Currency(nameUSD, codeUSD, rateUSD);

        String nameEUR = "Euro";
        String codeEUR = "EUR";
        double rateEUR = query.getResults().getResults().get(0).getRate();
        Currency currencyEUR = new Currency(nameEUR, codeEUR, rateEUR);
        javax.persistence.Query q1 = entityManager.createQuery("DELETE FROM Currency");

        q1.executeUpdate();
        entityManager.merge(currencyUAH);
        entityManager.merge(currencyUSD);
        entityManager.merge(currencyEUR);

    }
}
