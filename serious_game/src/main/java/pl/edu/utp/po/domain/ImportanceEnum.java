package pl.edu.utp.po.domain;

public enum ImportanceEnum {
    URGENT ("URGENT"),
    STANDARD ("STANDARD"),
    OPTIONAL ("OPTIONAL");
    
    private final String tekst;

    ImportanceEnum(final String tekst) {
        this.tekst = tekst;
    }
    
    @Override
    public String toString() {
        return tekst;
    }
}
