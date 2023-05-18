package kcure.portal.cmn.grid;

public enum CUD
{
    CREATE("CREATE", 0), 
    UPDATE("UPDATE", 1), 
    DELETE("DELETE", 2), 
    READ("READ", 3);
    
    private CUD(final String name, final int ordinal) {
    }
}
