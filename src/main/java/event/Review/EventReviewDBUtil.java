package event.Review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import event.admin.DBConnect;

public class EventReviewDBUtil {

    private static final String INSERT_REVIEW_SQL = "INSERT INTO reviews (Title, Rating, Review, ReviewerName, ReviewerEmail) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_REVIEW_BY_ID_SQL = "SELECT * FROM reviews WHERE ID=?";
    private static final String SELECT_ALL_REVIEWS_SQL = "SELECT * FROM reviews";
    private static final String UPDATE_REVIEW_SQL = "UPDATE reviews SET Title=?, Rating=?, Review=?, ReviewerName=?, ReviewerEmail=? WHERE ID=?";
    private static final String DELETE_REVIEW_SQL = "DELETE FROM reviews WHERE ID=?";

    // Insert a new review
    public void insertReview(EventReview review) throws SQLException {
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(INSERT_REVIEW_SQL)) {
            preparedStatement.setString(1, review.getTitle());
            preparedStatement.setInt(2, review.getRating());
            preparedStatement.setString(3, review.getReview());
            preparedStatement.setString(4, review.getReviewerName());
            preparedStatement.setString(5, review.getReviewerEmail());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Update an existing review
    public boolean updateReview(EventReview review) throws SQLException {
        boolean rowUpdated = false;
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(UPDATE_REVIEW_SQL)) {
            preparedStatement.setString(1, review.getTitle());
            preparedStatement.setInt(2, review.getRating());
            preparedStatement.setString(3, review.getReview());
            preparedStatement.setString(4, review.getReviewerName());
            preparedStatement.setString(5, review.getReviewerEmail());
            preparedStatement.setInt(6, review.getId());

            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Select a review by ID
    public EventReview selectReview(int id) {
        EventReview review = null;
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(SELECT_REVIEW_BY_ID_SQL)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String title = rs.getString("Title");
                int rating = rs.getInt("Rating");
                String reviewText = rs.getString("Review");
                String reviewerName = rs.getString("ReviewerName");
                String reviewerEmail = rs.getString("ReviewerEmail");

                review = new EventReview(id, title, rating, reviewText, reviewerName, reviewerEmail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return review;
    }

    // Select all reviews
    public List<EventReview> selectAllReviews() {
        List<EventReview> reviews = new ArrayList<>();
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_REVIEWS_SQL)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                String title = rs.getString("Title");
                int rating = rs.getInt("Rating");
                String reviewText = rs.getString("Review");
                String reviewerName = rs.getString("ReviewerName");
                String reviewerEmail = rs.getString("ReviewerEmail");

                reviews.add(new EventReview(id, title, rating, reviewText, reviewerName, reviewerEmail));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    // Delete a review by ID
    public boolean deleteReview(int id) throws SQLException {
        boolean rowDeleted = false;
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement statement = conn.prepareStatement(DELETE_REVIEW_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
}
