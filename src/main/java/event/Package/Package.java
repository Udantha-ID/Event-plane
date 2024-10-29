package event.Package;

public class Package {

    private int id;
    private String pkgName;          // Name of the event package
    private String description;      // Detailed description of the package
    private double price;            // Total price of the package
    private int duration;            // Duration in hours/days
    private String serviceLevel;     // Service level (e.g., "Basic", "Premium")
    private String eventType;        // Type of event (e.g., "Wedding", "Corporate")

    public Package(int id, String pkgName, String description, double price, int duration, String serviceLevel, String eventType) {
        this.id = id;
        this.pkgName = pkgName;
        this.description = description;
        this.price = price;
        this.duration = duration;
        this.serviceLevel = serviceLevel;
        this.eventType = eventType;
    }

    public Package(String pkgName, String description, double price, int duration, String serviceLevel, String eventType) {
        this.pkgName = pkgName;
        this.description = description;
        this.price = price;
        this.duration = duration;
        this.serviceLevel = serviceLevel;
        this.eventType = eventType;
    }

    public int getId() {
        return id;
    }

    public String getPkgName() {
        return pkgName;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public int getDuration() {
        return duration;
    }

    public String getServiceLevel() {
        return serviceLevel;
    }

    public String getEventType() {
        return eventType;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setPkgName(String pkgName) {
        this.pkgName = pkgName;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public void setServiceLevel(String serviceLevel) {
        this.serviceLevel = serviceLevel;
    }

    public void setEventType(String eventType) {
        this.eventType = eventType;
    }
}
