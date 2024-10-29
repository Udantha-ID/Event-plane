package event.addEvent;

public class Event {

    private int id;
    private String name; // Renamed from title to name to represent the event name
    private String type; // Renamed from genre to type (e.g., Concert, Conference, etc.)
    private String eventDate; // Renamed from releaseDate to eventDate
    private String organizer; // Renamed from director to organizer
    private String description;
    private String imageUrl; // Field for event image URL

    // Constructor with id
    public Event(int id, String name, String type, String eventDate, String organizer, String description, String imageUrl) {
        super();
        this.id = id;
        this.name = name;
        this.type = type;
        this.eventDate = eventDate;
        this.organizer = organizer;
        this.description = description;
        this.imageUrl = imageUrl;
    }

    // Constructor without id
    public Event(String name, String type, String eventDate, String organizer, String description, String imageUrl) {
        super();
        this.name = name;
        this.type = type;
        this.eventDate = eventDate;
        this.organizer = organizer;
        this.description = description;
        this.imageUrl = imageUrl;
    }

    // Getter for id
    public int getId() {
        return id;
    }

    // Getter for event name
    public String getName() {
        return name;
    }

    // Getter for event type
    public String getType() {
        return type;
    }

    // Getter for event date
    public String getEventDate() {
        return eventDate;
    }

    // Getter for organizer
    public String getOrganizer() {
        return organizer;
    }

    // Getter for description
    public String getDescription() {
        return description;
    }

    // Getter for image URL
    public String getImageUrl() {
        return imageUrl;
    }

    // Setter for image URL
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
