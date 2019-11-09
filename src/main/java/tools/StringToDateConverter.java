package tools;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StringToDateConverter implements Converter<String,Date> {
    private String pattan;

    public StringToDateConverter(String pattan) {
        this.pattan = pattan;
    }

    @Override
    public Date convert(String str) {
        Date date=null;
        try{
           date=new SimpleDateFormat(pattan).parse(str);
        }catch (ParseException exception){
            exception.printStackTrace();
        }
        return date;
    }
}
