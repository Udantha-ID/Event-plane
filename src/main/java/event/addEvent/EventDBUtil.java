package event.addEvent;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import event.admin.DBConnect;

public class EventDBUtil {

    private static final String INSERT_EVENT_SQL = "INSERT INTO events (Name, Type, EventDate, Organizer, Description, ImageUrl) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_EVENT_BY_ID_SQL = "SELECT * FROM events WHERE ID=?";
    private static final String SELECT_ALL_EVENTS_SQL = "SELECT * FROM events";
    private static final String UPDATE_EVENT_SQL = "UPDATE events SET Name=?, Type=?, EventDate=?, Organizer=?, Description=?, ImageUrl=? WHERE ID=?";
    private static final String DELETE_EVENT_SQL = "DELETE FROM events WHERE ID=?";

    // Method to insert a new event
    public void insertEvent(Event event) throws SQLException {
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(INSERT_EVENT_SQL)) {
            preparedStatement.setString(1, event.getName());
            preparedStatement.setString(2, event.getType());
            preparedStatement.setString(3, event.getEventDate());
            preparedStatement.setString(4, event.getOrganizer());
            preparedStatement.setString(5, event.getDescription());
            preparedStatement.setString(6, event.getImageUrl());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to update an existing event
    public boolean updateEvent(Event event) throws SQLException {
        boolean rowUpdated = false;
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(UPDATE_EVENT_SQL)) {
            preparedStatement.setString(1, event.getName());
            preparedStatement.setString(2, event.getType());
            preparedStatement.setString(3, event.getEventDate());
            preparedStatement.setString(4, event.getOrganizer());
            preparedStatement.setString(5, event.getDescription());
            preparedStatement.setString(6, event.getImageUrl());
            preparedStatement.setInt(7, event.getId());

            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Method to select an event by ID
    public Event selectEvent(int id) {
        Event event = null;
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(SELECT_EVENT_BY_ID_SQL)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("Name");
                String type = rs.getString("Type");
                String eventDate = rs.getString("EventDate");
                String organizer = rs.getString("Organizer");
                String description = rs.getString("Description");
                String imageUrl = rs.getString("ImageUrl");

                event = new Event(id, name, type, eventDate, organizer, description, imageUrl);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return event;
    }

    // Method to select all events
    public List<Event> selectAllEvents() {
        List<Event> events = new ArrayList<>();
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_EVENTS_SQL)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                String name = rs.getString("Name");
                String type = rs.getString("Type");
                String eventDate = rs.getString("EventDate");
                String organizer = rs.getString("Organizer");
                String description = rs.getString("Description");
                String imageUrl = rs.getString("ImageUrl");

                events.add(new Event(id, name, type, eventDate, organizer, description, imageUrl));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return events;
    }

    // Method to delete an event by ID
    public boolean deleteEvent(int id) throws SQLException {
        boolean rowDeleted = false;
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement statement = conn.prepareStatement(DELETE_EVENT_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
}
